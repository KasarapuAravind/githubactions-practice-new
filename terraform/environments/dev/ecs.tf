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