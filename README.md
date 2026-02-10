# terraform-github-repository

This module is used to create Github repositories with default settings.

## Usage

### Use the module

```hcl
module "repo" {
  source = "./"

  name = "my-repo"
}
```

<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1 |
| <a name="requirement_github"></a> [github](#requirement_github) | ~> 6, >= 6.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider_github) | ~> 6, >= 6.2.1 |

## Resources

| Name | Type |
|------|------|
| [github_branch.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_default.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_branch_protection.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_issue_label.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_ruleset.tag_protection](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset) | resource |
| [github_team.maintain](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team.read](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team.write](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team_repository.maintain](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_team_repository.read](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_team_repository.write](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_team.maintain](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/team) | data source |
| [github_team.read](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/team) | data source |
| [github_team.write](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/team) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input_name) | (Required) The name of the repository. | `string` | n/a | yes |
| <a name="input_allow_auto_merge"></a> [allow_auto_merge](#input_allow_auto_merge) | Set to `true` to allow auto-merging pull requests on the repository. | `bool` | `false` | no |
| <a name="input_allow_merge_commit"></a> [allow_merge_commit](#input_allow_merge_commit) | Set to `true` to enable merge commits on the repository. | `bool` | `false` | no |
| <a name="input_allow_rebase_merge"></a> [allow_rebase_merge](#input_allow_rebase_merge) | Set to `true` to disable rebase merges on the repository. | `bool` | `false` | no |
| <a name="input_allow_squash_merge"></a> [allow_squash_merge](#input_allow_squash_merge) | Set to `false` to disable squash merges on the repository. | `bool` | `true` | no |
| <a name="input_allow_update_branch"></a> [allow_update_branch](#input_allow_update_branch) | Set to `true` to always suggest updating pull request branches. | `bool` | `true` | no |
| <a name="input_archive_on_destroy"></a> [archive_on_destroy](#input_archive_on_destroy) | Set to false to delete the repository instead of archiving on destroy. | `bool` | `true` | no |
| <a name="input_archived"></a> [archived](#input_archived) | Specifies if the repository should be archived. Defaults to false. NOTE Currently, the API does not support unarchiving. | `bool` | `false` | no |
| <a name="input_auto_init"></a> [auto_init](#input_auto_init) | Set to `false` to prevent producing an initial commit in the repository. | `bool` | `true` | no |
| <a name="input_branch_protections"></a> [branch_protections](#input_branch_protections) | List of branches to protect, allong with their configuration. | ```map(object({ allows_deletions = optional(bool, false), allows_force_pushes = optional(bool, false), blocks_creations = optional(bool, false), contexts = optional(list(string), []), dismiss_stale_reviews = optional(bool, true), dismissal_restrictions = optional(list(string), []), enforce_admins = optional(bool, true), force_push_bypassers = optional(list(string), []), lock_branch = optional(bool, false), push_allowances = optional(list(string), []), pull_request_bypassers = optional(list(string), []), require_code_owner_reviews = optional(bool, true), require_conversation_resolution = optional(bool, true), require_last_push_approval = optional(bool, true), require_signed_commits = optional(bool, true), required_approving_review_count = optional(number, 2), required_linear_history = optional(bool, true), restrict_dismissals = optional(bool, false), strict = optional(bool, true), }))``` | `{}` | no |
| <a name="input_create_default_labels"></a> [create_default_labels](#input_create_default_labels) | Create github default labels | `bool` | `true` | no |
| <a name="input_create_new_teams"></a> [create_new_teams](#input_create_new_teams) | Create new teams to delegate permissions on the repositor. | `bool` | `false` | no |
| <a name="input_default_branch"></a> [default_branch](#input_default_branch) | The name of the repository branch. | `string` | `"main"` | no |
| <a name="input_delete_branch_on_merge"></a> [delete_branch_on_merge](#input_delete_branch_on_merge) | Automatically delete head branch after a pull request is merged. Defaults to true. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input_description) | A description of the repository. | `string` | `null` | no |
| <a name="input_gitignore_template"></a> [gitignore_template](#input_gitignore_template) | Use the name of the template without the extension. For example, `Haskell`. | `string` | `null` | no |
| <a name="input_has_discussions"></a> [has_discussions](#input_has_discussions) | Set to `true` to enable GitHub Discussions on the repository. Defaults to `false`. | `bool` | `false` | no |
| <a name="input_has_issues"></a> [has_issues](#input_has_issues) | Set to `true` to enable the GitHub Issues features on the repository. | `bool` | `false` | no |
| <a name="input_has_projects"></a> [has_projects](#input_has_projects) | Set to `true` to enable the GitHub Projects features on the repository. Per the GitHub documentation when in an organization that has disabled repository projects it will default to false and will otherwise default to true. If you specify true when it has been disabled it will return an error. | `bool` | `false` | no |
| <a name="input_has_wiki"></a> [has_wiki](#input_has_wiki) | Set to `true` to enable the GitHub Wiki features on the repository. | `bool` | `false` | no |
| <a name="input_homepage_url"></a> [homepage_url](#input_homepage_url) | URL of a page describing the project. | `string` | `null` | no |
| <a name="input_is_template"></a> [is_template](#input_is_template) | Set to `true` to tell GitHub that this is a template repository. | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input_labels) | List of issues label | ```map(object({ color = string, description = optional(string, null), }))``` | `{}` | no |
| <a name="input_license_template"></a> [license_template](#input_license_template) | Use the name of the template without the extension. For example, `mit` or `mpl-2.0`. | `string` | `null` | no |
| <a name="input_merge_commit_message"></a> [merge_commit_message](#input_merge_commit_message) | Message of merge commit messages. Can be `PR_BODY`, `PR_TITLE`, or `BLANK` for a default merge commit message. Applicable only if `allow_merge_commit` is `true`. | `string` | `"PR_TITLE"` | no |
| <a name="input_merge_commit_title"></a> [merge_commit_title](#input_merge_commit_title) | Title of merge commit messages. Can be `PR_TITLE` or `MERGE_MESSAGE` for a default merge commit title. Applicable only if `allow_merge_commit` is `true`. | `string` | `"MERGE_MESSAGE"` | no |
| <a name="input_protect_tags"></a> [protect_tags](#input_protect_tags) | Enable rules so only Repository and Organization admins can push tags. | `bool` | `true` | no |
| <a name="input_squash_merge_commit_message"></a> [squash_merge_commit_message](#input_squash_merge_commit_message) | Message of squash merge commit messages.Can be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK` for a default squash merge commit message. Applicable only if `allow_squash_merge` is `true`. | `string` | `"COMMIT_MESSAGES"` | no |
| <a name="input_squash_merge_commit_title"></a> [squash_merge_commit_title](#input_squash_merge_commit_title) | Title of squash merge commit messages. Can be `PR_TITLE` or `COMMIT_OR_PR_TITLE` for a default squash merge commit title. Applicable only if `allow_squash_merge` is `true`. | `string` | `"COMMIT_OR_PR_TITLE"` | no |
| <a name="input_teams_maintain"></a> [teams_maintain](#input_teams_maintain) | Slugs of the teams that will be granted the 'maintain' privilege. If null, a team will be created. | `list(string)` | `[]` | no |
| <a name="input_teams_read"></a> [teams_read](#input_teams_read) | Slugs of the teams that will be granted the 'pull' privilege. If null, a team will be created. | `list(string)` | `[]` | no |
| <a name="input_teams_write"></a> [teams_write](#input_teams_write) | Slugs of the teams that will be granted the 'write' privilege. If null, a team will be created. | `list(string)` | `[]` | no |
| <a name="input_template"></a> [template](#input_template) | Name of the template to use to create the repository (formed as 'owner/repository'). | `string` | `null` | no |
| <a name="input_topics"></a> [topics](#input_topics) | The list of topics of the repository. | `list(string)` | `[]` | no |
| <a name="input_visibility"></a> [visibility](#input_visibility) | Can be public or private. If your organization is associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+, visibility can also be internal. The visibility parameter overrides the private parameter. | `string` | `"private"` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability_alerts](#input_vulnerability_alerts) | Set to true to enable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level. (Note for importing: GitHub enables the alerts on public repos but disables them on private repos by default.) See GitHub Documentation for details. Note that vulnerability alerts have not been successfully tested on any GitHub Enterprise instance and may be unavailable in those settings. | `bool` | `true` | no |
| <a name="input_web_commit_signoff_required"></a> [web_commit_signoff_required](#input_web_commit_signoff_required) | Require contributors to sign off on web-based commits. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_full_name"></a> [full_name](#output_full_name) | A string of the form 'orgname/reponame'. |
| <a name="output_git_clone_url"></a> [git_clone_url](#output_git_clone_url) | URL that can be provided to git clone to clone the repository anonymously via the git protocol. |
| <a name="output_html_url"></a> [html_url](#output_html_url) | URL to the repository on the web. |
| <a name="output_http_clone_url"></a> [http_clone_url](#output_http_clone_url) | URL that can be provided to git clone to clone the repository via HTTPS. |
| <a name="output_ssh_clone_url"></a> [ssh_clone_url](#output_ssh_clone_url) | URL that can be provided to git clone to clone the repository via SSH. |
<!-- END_TF_DOCS -->
