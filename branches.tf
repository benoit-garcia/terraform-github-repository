resource "github_branch" "default" {
  count = var.default_branch == "main" ? 0 : 1

  repository = github_repository.this.name
  branch     = var.default_branch
}

resource "github_branch_default" "this" {
  repository = github_repository.this.name
  branch     = var.default_branch == "main" ? "main" : github_branch.default[0].branch
}

resource "github_branch_protection_v3" "this" {
  for_each = var.branch_protections

  repository = github_repository.this.name

  branch                          = each.key
  enforce_admins                  = each.value["enforce_admins"]
  require_signed_commits          = each.value["require_signed_commits"]
  require_conversation_resolution = each.value["require_conversation_resolution"]

  required_status_checks {
    strict = each.value["force_branch_update"]
    checks = each.value["checks"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = each.value["dismiss_stale_reviews"]
    dismissal_teams                 = each.value["dismissal_teams"]
    dismissal_users                 = each.value["dismissal_users"]
    require_code_owner_reviews      = each.value["require_code_owner_reviews"]
    required_approving_review_count = each.value["required_approving_review_count"]
  }
}
