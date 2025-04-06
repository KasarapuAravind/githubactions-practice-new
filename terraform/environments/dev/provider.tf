provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn     = var.oidc_assume_role_arn
    session_name = "GitHubActionsSession"
  }
}
