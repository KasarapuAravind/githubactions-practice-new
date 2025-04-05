resource "aws_ecr_repository" "repo" {
  name = "${var.env_name}-app-repo"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = var.env_name
  }
}
