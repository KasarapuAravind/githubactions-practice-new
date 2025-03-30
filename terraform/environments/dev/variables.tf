variable "bucket_name" {
    type = string
}

variable "tags" {
    type = map(string)
    default = {}  
}

variable "region" {
    type = string
    default = "us-east-1"  
}

variable "env" {}
variable "vpc_id" {}
variable "public_subnet_ids" {
  type = list(string)
}
variable "ecs_cluster_name" {}
variable "instance_type" {}
variable "instance_profile_name" {}
variable "task_execution_role_arn" {
  type        = string
  description = "IAM role ARN for ECS task execution"
}

variable "app_image_url" {
  type        = string
  description = "ECR image to run inside ECS container"
}

