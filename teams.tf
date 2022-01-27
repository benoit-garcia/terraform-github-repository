resource "github_team" "maintain" {
  count = length(var.teams_maintain) == 0 ? 1 : 0

  name        = format("%s - maintain", var.name)
  description = format("Grant permisions to read and clone repository %s. Members of this group can also manage issues and pull requests.", var.name)
  privacy     = "secret"

  lifecycle {
    ignore_changes = [
      etag,
    ]
  }
}

resource "github_team_repository" "maintain" {
  count = length(var.teams_maintain) == 0 ? 1 : length(var.teams_maintain)

  team_id    = length(var.teams_maintain) == 0 ? github_team.maintain[count.index].id : var.teams_maintain[count.index]
  repository = github_repository.this.name
  permission = "maintain"

  lifecycle {
    ignore_changes = [
      etag,
    ]
  }
}

resource "github_team" "read" {
  count = length(var.teams_read) == 0 ? 1 : 0

  name        = format("%s - read", var.name)
  description = format("Grant permisions to read and clone repository %s. Members of this group can also manage issues and pull requests.", var.name)
  privacy     = "secret"

  lifecycle {
    ignore_changes = [
      etag,
    ]
  }
}

resource "github_team_repository" "read" {
  count = length(var.teams_read) == 0 ? 1 : length(var.teams_read)

  team_id    = length(var.teams_read) == 0 ? github_team.read[count.index].id : var.teams_read[count.index]
  repository = github_repository.this.name
  permission = "pull"

  lifecycle {
    ignore_changes = [
      etag,
    ]
  }
}

resource "github_team" "write" {
  count = length(var.teams_write) == 0 ? 1 : 0

  name        = format("%s - write", var.name)
  description = format("Grant permisions to read and clone repository %s. Members of this group can also manage issues and pull requests.", var.name)
  privacy     = "secret"

  lifecycle {
    ignore_changes = [
      etag,
    ]
  }
}

resource "github_team_repository" "write" {
  count = length(var.teams_write) == 0 ? 1 : length(var.teams_write)

  team_id    = length(var.teams_write) == 0 ? github_team.write[count.index].id : var.teams_write[count.index]
  repository = github_repository.this.name
  permission = "push"

  lifecycle {
    ignore_changes = [
      etag,
    ]
  }
}
