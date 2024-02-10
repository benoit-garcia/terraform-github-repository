resource "github_branch" "default" {
  count = var.default_branch == "main" ? 0 : 1

  repository = github_repository.this.name
  branch     = var.default_branch
}

resource "github_branch_default" "this" {
  repository = github_repository.this.name
  branch     = var.default_branch == "main" ? "main" : github_branch.default[0].branch
}

resource "github_branch_protection" "this" {
  for_each = var.branch_protections

  repository_id = github_repository.this.name
  pattern       = each.key

  allows_deletions                = each.value["allows_deletions"]
  allows_force_pushes             = each.value["allows_force_pushes"]
  blocks_creations                = each.value["blocks_creations"]
  enforce_admins                  = each.value["enforce_admins"]
  force_push_bypassers            = each.value["force_push_bypassers"]
  lock_branch                     = each.value["lock_branch"]
  push_restrictions               = each.value["push_restrictions"]
  require_conversation_resolution = each.value["require_conversation_resolution"]
  require_signed_commits          = each.value["require_signed_commits"]
  required_linear_history         = each.value["required_linear_history"]

  required_pull_request_reviews {
    dismiss_stale_reviews           = each.value["dismiss_stale_reviews"]
    dismissal_restrictions          = each.value["dismissal_restrictions"]
    pull_request_bypassers          = each.value["pull_request_bypassers"]
    require_code_owner_reviews      = each.value["require_code_owner_reviews"]
    require_last_push_approval      = each.value["require_last_push_approval"]
    required_approving_review_count = each.value["required_approving_review_count"]
    restrict_dismissals             = each.value["restrict_dismissals"]
  }

  required_status_checks {
    strict   = each.value["strict"]
    contexts = each.value["contexts"]
  }
}
