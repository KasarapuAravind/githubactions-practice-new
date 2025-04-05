module "iam" {
  source   = "../../modules/iam"
  env_name = var.env_name
}

module "ecr" {
  source   = "../../modules/ecr"
  env_name = var.env_name
}

module "alb" {
  source            = "../../modules/alb"
  env_name          = var.env_name
  vpc_id            = var.vpc_id
  public_subnet_ids = var.public_subnet_ids
}

module "ecs" {
  source                    = "../../modules/ecs"
  env_name                  = var.env_name
  cluster_name              = "${var.env_name}-cluster"
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  private_subnet_ids        = var.private_subnet_ids
  asg_min_size              = var.asg_min_size
  asg_max_size              = var.asg_max_size
  asg_desired_capacity      = var.asg_desired_capacity
  ecs_instance_profile_name = module.iam.ecs_instance_profile_name
}

module "ecs_service" {
  source             = "../../modules/ecs-service"
  env_name           = var.env_name
  cluster_name       = module.ecs.cluster_name
  target_group_arn   = module.alb.alb_target_group_arn
  ecr_image_url      = module.ecr.ecr_repository_url # dynamic
  image_tag          = var.image_tag                 # from tfvars or workflow
  task_exec_role_arn = module.iam.ecs_task_execution_role_arn
  aws_region         = var.aws_region
}

