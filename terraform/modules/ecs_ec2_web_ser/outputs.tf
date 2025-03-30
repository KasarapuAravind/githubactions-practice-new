output "repository_url" {
  description = "Full ECR repository URL"
  value       = aws_ecr_repository.this.repository_url
}
