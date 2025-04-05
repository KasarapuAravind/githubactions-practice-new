resource "aws_launch_template" "ecs_lt" {
  name_prefix   = "${var.env_name}-ecs-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = var.ecs_instance_profile_name
  }

  user_data = base64encode(templatefile("${path.module}/userdata.sh", {
    cluster_name = var.cluster_name
  }))
}

resource "aws_autoscaling_group" "ecs_asg" {
  name_prefix         = "${var.env_name}-ecs-asg"
  max_size            = var.asg_max_size
  min_size            = var.asg_min_size
  desired_capacity    = var.asg_desired_capacity
  vpc_zone_identifier = var.private_subnet_ids
  launch_template {
    id      = aws_launch_template.ecs_lt.id
    version = "$Latest"
  }
  health_check_type = "EC2"
  tag {
    key                 = "AmazonECSCluster"
    value               = var.cluster_name
    propagate_at_launch = true
  }
}

resource "aws_ecs_cluster" "ecs" {
  name = var.cluster_name
}

resource "aws_ecs_capacity_provider" "ecs_cp" {
  name = "${var.env_name}-cp"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.ecs_asg.arn

    managed_scaling {
      status                    = "ENABLED"
      target_capacity           = 80
      minimum_scaling_step_size = 1
      maximum_scaling_step_size = 100
    }

    managed_termination_protection = "DISABLED"
  }

  tags = {
    Environment = var.env_name
  }
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cp_attach" {
  cluster_name = aws_ecs_cluster.ecs.name
  capacity_providers = [
    aws_ecs_capacity_provider.ecs_cp.name
  ]
}
