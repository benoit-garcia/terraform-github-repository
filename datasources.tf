data "github_team" "maintain" {
  count = length(var.teams_maintain)

  slug = var.teams_maintain[count.index]
}

data "github_team" "read" {
  count = length(var.teams_read)

  slug = var.teams_read[count.index]
}

data "github_team" "write" {
  count = length(var.teams_write)

  slug = var.teams_write[count.index]
}
