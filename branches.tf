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
  count = length(var.branch_protections)

  repository = github_repository.this.name

  branch                          = var.branch_protections[count.index].branch
  enforce_admins                  = var.branch_protections[count.index].enforce_admins
  require_signed_commits          = var.branch_protections[count.index].require_signed_commits
  require_conversation_resolution = var.branch_protections[count.index].require_conversation_resolution

  required_status_checks {
    strict = var.branch_protections[count.index].force_branch_update
    checks = var.branch_protections[count.index].checks
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = var.branch_protections[count.index].dismiss_stale_reviews
    dismissal_teams                 = var.branch_protections[count.index].dismissal_teams
    dismissal_users                 = var.branch_protections[count.index].dismissal_users
    require_code_owner_reviews      = var.branch_protections[count.index].require_code_owner_reviews
    required_approving_review_count = var.branch_protections[count.index].required_approving_review_count
  }
}
