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

variable "merge_commit_title" {
  description = "Title of merge commit messages. Can be `PR_TITLE` or `MERGE_MESSAGE` for a default merge commit title. Applicable only if `allow_merge_commit` is `true`."
  type        = string
  default     = "MERGE_MESSAGE"
  validation {
    condition     = var.merge_commit_title == "PR_TITLE" || var.merge_commit_title == "MERGE_MESSAGE"
    error_message = "The `merge_commit_title` value must be `PR_TITLE` or `MERGE_MESSAGE`."
  }
}

variable "merge_commit_message" {
  description = "Message of merge commit messages. Can be `PR_BODY`, `PR_TITLE`, or `BLANK` for a default merge commit message. Applicable only if `allow_merge_commit` is `true`."
  type        = string
  default     = "PR_TITLE"
  validation {
    condition     = var.merge_commit_message == "PR_BODY" || var.merge_commit_message == "PR_TITLE" || var.merge_commit_message == "BLANK"
    error_message = "The `merge_commit_message` value must be `PR_BODY`, `PR_TITLE`, or `BLANK`."
  }
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

variable "squash_merge_commit_title" {
  description = "Title of squash merge commit messages. Can be `PR_TITLE` or `COMMIT_OR_PR_TITLE` for a default squash merge commit title. Applicable only if `allow_squash_merge` is `true`."
  type        = string
  default     = "COMMIT_OR_PR_TITLE"
  validation {
    condition     = var.squash_merge_commit_title == "PR_TITLE" || var.squash_merge_commit_title == "COMMIT_OR_PR_TITLE"
    error_message = "The `squash_merge_commit_title` value must be `PR_TITLE` or `COMMIT_OR_PR_TITLE`."
  }
}

variable "squash_merge_commit_message" {
  description = "Message of squash merge commit messages.Can be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK` for a default squash merge commit message. Applicable only if `allow_squash_merge` is `true`."
  type        = string
  default     = "COMMIT_MESSAGES"
  validation {
    condition     = var.squash_merge_commit_message == "PR_BODY" || var.squash_merge_commit_message == "COMMIT_MESSAGES" || var.squash_merge_commit_message == "BLANK"
    error_message = "The `squash_merge_commit_message` value must be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK`."
  }
}

variable "allow_update_branch" {
  description = "Set to `true` to always suggest updating pull request branches."
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

variable "has_discussions" {
  description = " Set to `true` to enable GitHub Discussions on the repository. Defaults to `false`."
  type        = bool
  default     = false
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

variable "create_new_teams" {
  description = "Create new teams to delegate permissions on the repositor."
  type        = bool
  default     = false
}

variable "teams_maintain" {
  description = "Slugs of the teams that will be granted the 'maintain' privilege. If null, a team will be created."
  type        = list(string)
  default     = []
}

variable "teams_read" {
  description = "Slugs of the teams that will be granted the 'pull' privilege. If null, a team will be created."
  type        = list(string)
  default     = []
}

variable "teams_write" {
  description = "Slugs of the teams that will be granted the 'write' privilege. If null, a team will be created."
  type        = list(string)
  default     = []
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

variable "web_commit_signoff_required" {
  description = "Require contributors to sign off on web-based commits."
  type        = bool
  default     = false
}

variable "tag_protections" {
  description = "List of tag patterns to protect."
  type        = list(string)
  default     = []
}

variable "branch_protections" {
  description = "List of branches to protect, allong with their configuration."
  type = map(object({
    allows_deletions                = optional(bool, false),
    allows_force_pushes             = optional(bool, false),
    blocks_creations                = optional(bool, false),
    contexts                        = optional(list(string), []),
    dismiss_stale_reviews           = optional(bool, true),
    dismissal_restrictions          = optional(list(string), []),
    enforce_admins                  = optional(bool, true),
    force_push_bypassers            = optional(list(string), []),
    lock_branch                     = optional(bool, false),
    push_allowances                 = optional(list(string), []),
    pull_request_bypassers          = optional(list(string), []),
    require_code_owner_reviews      = optional(bool, true),
    require_conversation_resolution = optional(bool, true),
    require_last_push_approval      = optional(bool, true),
    require_signed_commits          = optional(bool, true),
    required_approving_review_count = optional(number, 2),
    required_linear_history         = optional(bool, true),
    restrict_dismissals             = optional(bool, false),
    strict                          = optional(bool, true),
  }))
  default = {}
}
