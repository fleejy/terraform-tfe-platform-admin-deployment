# Platform Admin Management

Terraform repo to manage the lifecycle of objects within an organization in HCP Terraform (HCPT) or Terraform Enterprise (TFE).

https://app.terraform.io/app/fleejy-hashi/registry/modules/private/fleejy-hashi/terraform-tfe-platform-admin-module/fleejy/0.1.0
- This module is used to deploy the following objects in HCPT/TFE:
    - Projects
    - Project-level workspaces
    - Teams
    - Policy Sets
    - Private Modules into the Private Registry


## Teams
```yaml
team-B:
  name: team-B
  visibility: organization
  organization_access:
    arguments:
      read_workspaces: true
      read_projects: true
      manage_policies: false
      manage_policy_overrides: false
      manage_workspaces: false
      manage_vcs_settings: false
      manage_providers: false
      manage_modules: false
      manage_run_tasks: false
      manage_projects: false
      manage_membership: false
```
`team-B`'s organizational access is defined by the resource `team_project_access` with booleans to allow/disallow permissions.
[HashiCorp Docs: team_project_access](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_project_access)