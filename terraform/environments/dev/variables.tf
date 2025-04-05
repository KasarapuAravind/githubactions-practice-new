variable "env_name" {
  description = "Environment name (dev/test/prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for ECS and ALB"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for ECS EC2 instances"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID to use for ECS EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for ECS worker nodes"
  type        = string
}

variable "asg_min_size" {
  description = "Minimum size of ECS Auto Scaling Group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum size of ECS Auto Scaling Group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired size of ECS Auto Scaling Group"
  type        = number
}

variable "image_tag" {
  description = "Docker image tag to deploy from ECR"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "oidc_assume_role_arn" {
  description = "ARN of the IAM role to assume using OIDC (GitHub Actions)"
  type        = string
}
