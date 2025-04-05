variable "env_name" {
  description = "Environment name (e.g., dev, test, prod)"
  type        = string
}

variable "cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "target_group_arn" {
  description = "ALB Target Group ARN to attach ECS service"
  type        = string
}

variable "ecr_image_url" {
  description = "ECR image URL (without tag)"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  type        = string
}

variable "task_exec_role_arn" {
  description = "ECS task execution IAM role ARN"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}
