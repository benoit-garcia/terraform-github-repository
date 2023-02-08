resource "github_team" "maintain" {
  count = var.create_new_teams && length(var.teams_maintain) == 0 ? 1 : 0

  name        = format("%s - maintain", var.name)
  description = format("Grant permisions to read and clone repository %s. Members of this group can also manage issues and pull requests.", var.name)
  privacy     = "secret"
}

resource "github_team_repository" "maintain" {
  count = var.create_new_teams && length(var.teams_maintain) == 0 ? 1 : length(var.teams_maintain)

  team_id    = length(var.teams_maintain) == 0 ? github_team.maintain[count.index].id : data.github_team.maintain[count.index].id
  repository = github_repository.this.name
  permission = "maintain"
}

resource "github_team" "read" {
  count = var.create_new_teams && length(var.teams_read) == 0 ? 1 : 0

  name        = format("%s - read", var.name)
  description = format("Grant permisions to read and clone repository %s. Members of this group can also manage issues and pull requests.", var.name)
  privacy     = "secret"
}

resource "github_team_repository" "read" {
  count = var.create_new_teams && length(var.teams_read) == 0 ? 1 : length(var.teams_read)

  team_id    = length(var.teams_read) == 0 ? github_team.read[count.index].id : data.github_team.read[count.index].id
  repository = github_repository.this.name
  permission = "pull"
}

resource "github_team" "write" {
  count = var.create_new_teams && length(var.teams_write) == 0 ? 1 : 0

  name        = format("%s - write", var.name)
  description = format("Grant permisions to read and clone repository %s. Members of this group can also manage issues and pull requests.", var.name)
  privacy     = "secret"
}

resource "github_team_repository" "write" {
  count = var.create_new_teams && length(var.teams_write) == 0 ? 1 : length(var.teams_write)

  team_id    = length(var.teams_write) == 0 ? github_team.write[count.index].id : data.github_team.write[count.index].id
  repository = github_repository.this.name
  permission = "push"
}
