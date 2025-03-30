data "aws_caller_identity" "current" {}

resource "aws_ecs_cluster" "ecs_cluster" {
    name = "${var.env}-ecs-java-app-cluster"
}

resource "aws_ecr_repository" "ecr_repo" {
    name = "${var.env}-ecr-java-app-repo"
    image_tag_mutability = "MUTABLE"
    force_delete = true
}

resource "aws_iam_role" "ecs_task_execution" {
    name = "${var.env}-ecs-java-app-task-execution-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Effect = "Allow",
                Principal = {
                    Service = "ecs-tasks.amazonaws.com"
                },
                Action = "sts:AssumeRole"
            }
        ]

    })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
    role = aws_iam_role.ecs_task_execution.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_task_definition" "java_app_task" {
    family = "${var.env}-java-app"
    network_mode = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu = "256"
    memory = "512"
    execution_role_arn = aws_iam_role.ecs_task_execution.arn

    container_definitions = jsonencode([
        {
            name = "java-app"
            image = "${aws_ecr_repository.ecr_repo.repository_url}:latest"
            portMappings = [
                {
                    containerPort = 8080
                    protocol = "tcp"
                }
            ]
        }

    ])
  
}


resource "aws_ecs_service" "java_app_service" {
    name = "${var.env}-java-service"
    cluster = aws_ecs_cluster.ecs_cluster.id
    task_definition = aws_ecs_task_definition.java_app_task.arn
    desired_count = 1
    launch_type = "FARGATE"

    network_configuration {
      subnets = var.public_subnet_ids
      security_groups = [var.ecs_sg_id]
      assign_public_ip = true
    }

    deployment_controller {
      type = "ECS"
    }
  
}