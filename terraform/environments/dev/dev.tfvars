env_name             = "dev"
vpc_id               = "vpc-xxxxxxxx"
public_subnet_ids    = ["subnet-0719c36565fdb31bf", "subnet-033e2923e68aa48a2"]
private_subnet_ids   = ["subnet-0719c36565fdb31bf", "subnet-033e2923e68aa48a2"]
ami_id               = "ami-xxxxxx"
instance_type        = "t2.micro"
asg_min_size         = 1
asg_max_size         = 2
asg_desired_capacity = 1
image_tag            = "latest"
aws_region           = "us-east-1"
oidc_assume_role_arn = "arn:aws:iam::084375583445:role/My-GitHub-Actions-Role"
tags = {
  environment = "dev"
  owner       = "aravind"
}
region = "us-east-1"


