bucket_name = "myapp-aravindkasarapu-dev-s3bucket"
tags = {
  environment = "dev"
  owner = "aravind"
}
region = "us-east-1"
env = "dev"
vpc_id            = "vpc-02f0eb2fcb3026261"
public_subnet_ids = ["subnet-0719c36565fdb31bf", "subnet-033e2923e68aa48a2"]
ecs_sg_id         = "sg-0af70b2f854bc5ecb"