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

variable "env" {
    type = string
    description = "Environment type(dev,test,prod)"  
}

variable "vpc_id" {
  description = "VPC ID for ECS networking"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ECS tasks"
  type        = list(string)
}

variable "ecs_sg_id" {
  description = "Security Group ID to attach to ECS tasks"
  type        = string
}
