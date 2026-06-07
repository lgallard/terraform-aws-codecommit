![Terraform](https://lgallardo.com/images/terraform.jpg)
# terraform-aws-codecommit

> [!IMPORTANT]
> **This module is deprecated and archived.**
>
> AWS CodeCommit is no longer available to new AWS customers. Existing AWS CodeCommit customers can continue to use the service as normal, so this repository remains available as a read-only reference for existing users. See the [AWS CodeCommit availability notice](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-resource-codecommit-repository.html) and AWS's [migration guidance for moving CodeCommit repositories to another Git provider](https://aws.amazon.com/blogs/devops/how-to-migrate-your-aws-codecommit-repository-to-another-git-provider/).
>
> New projects should use another Git provider such as GitHub, GitLab, Bitbucket, or AWS-supported third-party integrations instead of starting new CodeCommit-based infrastructure.

Terraform module to create [AWS CodeCommit](https://aws.amazon.com/codecommit/) repositories. AWS CodeCommit is a fully-managed source control service that hosts secure Git-based repositories.

## Usage

You can use this module to create an AWS CodeCommit repositories using few parameters (simple example) or define in detail every aspect of the repositories (complete example).

Check the [examples](examples/) for the  **simple** and the **complete** snippets.

### Simple example
This example creates an CodeCommit repository using few parameters
```
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

```

### Complete example
In this example the repository is defined in detailed.

```
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

```

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| default\_branch | The default branch of the repository. The branch specified here needs to exist. | `string` | n/a | yes |
| description | The description of the repository. This needs to be less than 1000 characters | `string` | n/a | yes |
| repository\_name | The name for the repository. This needs to be less than 100 characters. | `string` | n/a | yes |
| tags | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| triggers | List of triggers | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the repository |
| clone\_url\_http | The URL to use for cloning the repository over HTTPS. |
| clone\_url\_ssh | The URL to use for cloning the repository over SSH. |
| name | The name for the repository |
| repository\_id | The ID of the repository |

## Known issues
During the developing of the module I found an issue when trying to create several triggers for a repository. This is an issue reported inr the AWS provider at [Multiple codecommit triggers](https://github.com/terraform-providers/terraform-provider-aws/issues/3209)
