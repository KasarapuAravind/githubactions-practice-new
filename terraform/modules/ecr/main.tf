resource "aws_ecr_repository" "app_repo" {
  name = "${var.env_name}-app-repo"
  image_scanning_configuration {
    scan_on_push = true
  }
}
