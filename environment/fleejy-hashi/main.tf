locals {
  teams            = fileset("${path.module}/", "teams/**/*.yaml")
  projects         = fileset("${path.module}/", "projects/**/*.yaml")
  policy_sets      = fileset("${path.module}/", "policy-sets/**/*.yaml")
  registry_modules = fileset("${path.module}/", "registry-modules/**/*.yaml")
}

module "platform_admin_module" {
  #Optimally you would publish this module into the Private Registry of your org in TFC/E, then have the address to that module as the value for the source argument
  source  = "app.terraform.io/fleejy-hashi/terraform-tfe-platform-admin-module/fleejy"
  version = "0.1.0"

  fixed_teams      = merge([for team in local.teams : yamldecode(file(team))]...)
  fixed_projects   = merge([for project in local.projects : yamldecode(file(project))]...)
  policy_sets      = merge([for policy_set in local.policy_sets : yamldecode(file(policy_set))]...)
  registry_modules = merge([for registry_module in local.registry_modules : yamldecode(file(registry_module))]...)

  tfe_hostname     = var.tfe_hostname
  tfe_organization = var.tfe_organization
  github_app_name  = var.github_app_name

}

resource "tfe_organization" "fleejy-hashi" {
  email                                                   = "francisco.lee@ibm.com"
  name                                                    = "fleejy-hashi"
  aggregated_commit_status_enabled                        = true
  allow_force_delete_workspaces                           = false
  assessments_enforced                                    = false
  collaborator_auth_policy                                = "password"
  cost_estimation_enabled                                 = true
  owners_team_saml_role_id                                = null
  send_passing_statuses_for_untriggered_speculative_plans = false
  session_remember_minutes                                = 0
  session_timeout_minutes                                 = 0
  speculative_plan_management_enabled                     = true
}
