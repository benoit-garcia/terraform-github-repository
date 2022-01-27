output "html_url" {
  value       = github_repository.this.html_url
  description = "URL to the repository on the web."
}

output "full_name" {
  value       = github_repository.this.full_name
  description = "A string of the form 'orgname/reponame'."
}

output "ssh_clone_url" {
  value       = github_repository.this.ssh_clone_url
  description = "URL that can be provided to git clone to clone the repository via SSH."
}

output "http_clone_url" {
  value       = github_repository.this.http_clone_url
  description = "URL that can be provided to git clone to clone the repository via HTTPS."
}

output "git_clone_url" {
  value       = github_repository.this.git_clone_url
  description = "URL that can be provided to git clone to clone the repository anonymously via the git protocol."
}
