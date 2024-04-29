resource "github_issue_label" "this" {
  for_each = var.create_default_labels ? merge(local.default_labels, var.labels) : var.labels

  repository  = github_repository.this.name
  name        = each.key
  color       = each.value["color"]
  description = each.value["description"]
}
