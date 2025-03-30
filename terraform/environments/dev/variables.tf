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
