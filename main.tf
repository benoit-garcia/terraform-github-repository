resource "github_repository" "this" {
  name = var.name

  # Informations
  description          = var.description
  homepage_url         = var.homepage_url
  is_template          = var.is_template
  topics               = var.topics
  visibility           = var.visibility
  vulnerability_alerts = var.vulnerability_alerts

  # Initialization settings
  auto_init          = var.auto_init
  gitignore_template = var.gitignore_template
  license_template   = var.license_template

  # Merge settings
  allow_auto_merge       = var.allow_auto_merge
  allow_merge_commit     = var.allow_merge_commit
  allow_rebase_merge     = var.allow_rebase_merge
  allow_squash_merge     = var.allow_squash_merge
  delete_branch_on_merge = var.delete_branch_on_merge

  # Archiving behavior
  archive_on_destroy = var.archive_on_destroy
  archived           = var.archived

  # Features
  has_downloads = var.has_downloads
  has_issues    = var.has_issues
  has_projects  = var.has_projects
  has_wiki      = var.has_wiki
  // pages         = var.pages

  dynamic "template" {
    for_each = var.template != null ? [1] : []

    content {
      owner      = split("/", var.template)[0]
      repository = split("/", var.template)[1]
    }
  }

  lifecycle {
    ignore_changes = [
      archive_on_destroy,
      auto_init,
    ]
  }
}

resource "github_branch" "default" {
  count = var.default_branch == "main" ? 0 : 1

  repository = github_repository.this.name
  branch     = var.default_branch
}

resource "github_branch_default" "this" {
  repository = github_repository.this.name
  branch     = var.default_branch == "main" ? "main" : github_branch.default[0].branch
}

resource "github_repository_tag_protection" "this" {
  count = length(var.tag_protections)

  repository = github_repository.this.name
  pattern    = var.tag_protections[count.index]
}
