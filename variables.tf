# General vars
variable "repository_name" {
  description = "The name for the repository. This needs to be less than 100 characters."
  type        = string
}

variable "description" {
  description = "The description of the repository. This needs to be less than 1000 characters"
  type        = string
  default     = null
}

variable "default_branch" {
  description = "The default branch of the repository. The branch specified here needs to exist."
  type        = string
  default     = null
}

# Triggers
variable "triggers" {
  description = "List of triggers"
  type        = any
  default     = []
}

# Tags
variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

