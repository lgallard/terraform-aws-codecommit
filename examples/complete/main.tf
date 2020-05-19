module "codecommit" {

  source = "lgallard/codecommit/aws"

  repository_name = "codecommit-repo"
  description     = "Git repositoriy in AWS"
  default_branch  = "master"

  triggers = [
    {
      name            = "all"
      events          = ["all"]
      destination_arn = "arn:aws:lambda:us-east-1:12345678910:function:lambda-all"
    },
    {
      name            = "updateReference"
      events          = ["updateReference"]
      destination_arn = "arn:aws:lambda:us-east-1:12345678910:function:lambda-updateReference"
    },
  ]

  tags = {
    Owner       = "DevOps team"
    Environment = "dev"
    Terraform   = true
  }

}
