resource "aws_codecommit_repository" "repo" {
  repository_name = var.repository_name
  description     = var.description
  default_branch  = var.default_branch

  # Tags
  tags = var.tags

}

# Triggers
resource "aws_codecommit_trigger" "triggers" {
  count           = length(var.triggers)
  repository_name = aws_codecommit_repository.repo.repository_name

  trigger {
    name            = lookup(element(var.triggers, count.index), "name")
    events          = lookup(element(var.triggers, count.index), "events")
    destination_arn = lookup(element(var.triggers, count.index), "destination_arn")
  }

}
