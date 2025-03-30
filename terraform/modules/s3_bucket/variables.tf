variable "bucket_name" {
    type = string
}

variable "tags" {
    type = map(string)  
    default = {}
}

variable "env" {
  description = "Environment (dev, test, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for networking"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "ecs_cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for ECS"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile name for ECS EC2 instances"
  type        = string
}
