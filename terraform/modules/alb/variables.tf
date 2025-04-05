variable "env_name" {
  description = "Environment name (e.g., dev, test, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to deploy ALB"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}
