module "ecs_web" {
  source               = "../../modules/ecs_ec2_web_servce"
  env                  = var.env
  vpc_id               = var.vpc_id
  public_subnet_ids    = var.public_subnet_ids
  ecs_cluster_name     = var.ecs_cluster_name
  instance_type        = var.instance_type
  instance_profile_name = var.instance_profile_name
}
