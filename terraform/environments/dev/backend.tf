terraform {
  backend "s3" {
    bucket       = "dev-aravind-terraform-state-bucket"
    key          = "s3/dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}