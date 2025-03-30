module "ecs_web" {
  source = "../../modules/ecs_ec2_web_ser"
  env                  = var.env
  vpc_id               = var.vpc_id
  public_subnet_ids    = var.public_subnet_ids
  ecs_cluster_name     = var.ecs_cluster_name
  instance_type        = var.instance_type

  task_execution_role_arn = var.task_execution_role_arn
  app_image_url           = var.app_image_url
}


module "ecr_repo" {
  source = "../../modules/ecr_repo"

  name = "${var.env}-java-web-app"
  tags = {
    Environment = var.env
    Name        = "${var.env}-java-web-app"
  }
}
