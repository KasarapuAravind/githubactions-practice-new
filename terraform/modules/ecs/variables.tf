variable "env_name" {
  description = "Environment name (e.g., dev, test, prod)"
  type        = string
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for ECS EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for ECS EC2 worker nodes"
  type        = string
}

variable "asg_min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group"
  type        = number
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for ECS instances"
  type        = list(string)
}

variable "ecs_instance_profile_name" {
  description = "IAM instance profile name for ECS EC2 instances"
  type        = string
}
