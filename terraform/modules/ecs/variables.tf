variable "env_name" {}
variable "cluster_name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "asg_min_size" {}
variable "asg_max_size" {}
variable "asg_desired_capacity" {}
variable "private_subnet_ids" {
  type = list(string)
}

# IAM role/profile created externally or in a separate module
variable "ecs_instance_profile_name" {}
