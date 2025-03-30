bucket_name = "myapp-aravindkasarapu-dev-s3bucket"
tags = {
  environment = "dev"
  owner = "aravind"
}
region = "us-east-1"
env                   = "dev"
vpc_id                = "vpc-02f0eb2fcb3026261"
public_subnet_ids     = ["subnet-0719c36565fdb31bf", "subnet-033e2923e68aa48a2"]
ecs_cluster_name      = "dev-ecs-cluster"
instance_type         = "t3.micro"
instance_profile_name = "ecsInstanceRole"

