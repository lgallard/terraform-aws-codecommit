module "codecommit" {

  source = "lgallard/codecommit/aws"

  repository_name = "codecommit-repo"
  description     = "Git repositoriy in AWS"

  tags = {
    Owner       = "DevOps team"
    Environment = "dev"
    Terraform   = true
  }

}
