variable "name" {
  description = "(Required) The name of the repository."
  type        = string
}

variable "allow_auto_merge" {
  description = "Set to `true` to allow auto-merging pull requests on the repository."
  type        = bool
  default     = false
}

variable "allow_merge_commit" {
  description = "Set to `true` to enable merge commits on the repository."
  type        = bool
  default     = false
}

variable "allow_rebase_merge" {
  description = "Set to `true` to disable rebase merges on the repository."
  type        = bool
  default     = false
}

variable "allow_squash_merge" {
  description = "Set to `false` to disable squash merges on the repository."
  type        = bool
  default     = true
}

variable "archive_on_destroy" {
  description = "Set to false to delete the repository instead of archiving on destroy."
  type        = bool
  default     = true
}

variable "archived" {
  description = "Specifies if the repository should be archived. Defaults to false. NOTE Currently, the API does not support unarchiving."
  type        = bool
  default     = false
}

variable "auto_init" {
  description = "Set to `false` to prevent producing an initial commit in the repository."
  type        = bool
  default     = true
}

variable "default_branch" {
  description = "The name of the repository branch."
  type        = string
  default     = "main"
}

variable "delete_branch_on_merge" {
  description = "Automatically delete head branch after a pull request is merged. Defaults to true."
  type        = bool
  default     = true
}

variable "description" {
  description = "A description of the repository."
  type        = string
  default     = null
}

variable "gitignore_template" {
  description = "Use the name of the template without the extension. For example, `Haskell`."
  type        = string
  default     = null
}

variable "has_downloads" {
  description = "Set to `true` to enable the (deprecated) downloads features on the repository."
  type        = bool
  default     = false
}

variable "has_issues" {
  description = "Set to `true` to enable the GitHub Issues features on the repository."
  type        = bool
  default     = false
}

variable "has_projects" {
  description = "Set to `true` to enable the GitHub Projects features on the repository. Per the GitHub documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error."
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "Set to `true` to enable the GitHub Wiki features on the repository."
  type        = bool
  default     = false
}

variable "homepage_url" {
  description = "URL of a page describing the project."
  type        = string
  default     = null
}

variable "is_template" {
  description = "Set to `true` to tell GitHub that this is a template repository."
  type        = bool
  default     = false
}

variable "license_template" {
  description = "Use the name of the template without the extension. For example, `mit` or `mpl-2.0`."
  type        = string
  default     = null
}

variable "template" {
  description = "Name of the template to use to create the repository (formed as 'owner/repository')."
  type        = string
  default     = null
}

variable "topics" {
  description = "The list of topics of the repository."
  type        = list(string)
  default     = []
}

variable "visibility" {
  description = "Can be public or private. If your organization is associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+, visibility can also be internal. The visibility parameter overrides the private parameter."
  type        = string
  default     = "private"
}

variable "vulnerability_alerts" {
  description = "Set to true to enable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level. (Note for importing: GitHub enables the alerts on public repos but disables them on private repos by default.) See GitHub Documentation for details. Note that vulnerability alerts have not been successfully tested on any GitHub Enterprise instance and may be unavailable in those settings."
  type        = bool
  default     = true
}
