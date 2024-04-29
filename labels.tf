resource "github_issue_labels" "this" {
  repository = github_repository.this.name
  dynamic "label" {
    for_each = var.create_default_labels ? merge(local.default_labels, var.labels) : var.labels
    content {
      name        = label.key
      color       = label.value["color"]
      description = label.value["description"]
    }
  }
}
