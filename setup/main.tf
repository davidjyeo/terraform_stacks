### tfc ###

resource "tfe_organization" "org" {
  name  = "stacks"
  email = "user@domain.local"
}

resource "tfe_project" "project" {
  organization = tfe_organization.org.name
  name         = "tfc_stacks"
}

# resource "tfe_oauth_client" "test" {
#   organization     = "my-example-org"
#   api_url          = "https://api.github.com"
#   http_url         = "https://github.com"
#   oauth_token      = var.github_token
#   service_provider = "github"
# }


# resource "tfe_stack" "test-stack" {
#   name        = "my-stack"
#   description = "A Terraform Stack using two components with two environments"
#   project_id  = tfe_project.project.id

#   # vcs_repo {
#   #   branch         = "main"
#   #   identifier     = "my-github-org/stack-repo"
#   #   oauth_token_id = tfe_oauth_client.test.oauth_token_id
#   # }
# }

### azure ###

# data about the current subscription
data "azurerm_subscription" "current" {}

data "azurerm_management_group" "root_mgmt_group" {
  name = "88ef261e-b19b-4d71-9afd-cdac31a6dcda"
}

# create an app registration
resource "azuread_application" "tfc_stacks" {
  display_name = "hcp-terraform-azure"
}

# create a service principal for the app
resource "azuread_service_principal" "tfc_stacks" {
  client_id = azuread_application.tfc_stacks.client_id
}

# assign the contributor role for the service principal
resource "azurerm_role_assignment" "contributor" {
  scope                = data.azurerm_management_group.root_mgmt_group.id
  principal_id         = azuread_service_principal.tfc_stacks.object_id
  role_definition_name = "Contributor"
}

# create federated identity credentials for **plan** operations
# for each deployment name
resource "azuread_application_federated_identity_credential" "plan" {
  for_each       = toset(var.deployment_names)
  application_id = azuread_application.tfc_stacks.id
  display_name   = "stack-deployment-${each.value}-plan"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://app.terraform.io"
  description    = "Plan operation for deployment '${each.value}'"
  subject = join(":", [
    "organization",
    var.organization_name,
    "project",
    var.project_name,
    "stack",
    var.stack_name,
    "deployment",
    each.value,
    "operation",
    "plan"
  ])
}

# create federated identity credentials for **apply** operations
# for each deployment name
resource "azuread_application_federated_identity_credential" "apply" {
  for_each       = toset(var.deployment_names)
  application_id = azuread_application.tfc_stacks.id
  display_name   = "stack-deployment-${each.value}-apply"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://app.terraform.io"
  description    = "Apply operation for deployment '${each.value}'"
  subject = join(":", [
    "organization",
    var.organization_name,
    "project",
    var.project_name,
    "stack",
    var.stack_name,
    "deployment",
    each.value,
    "operation",
    "apply"
  ])
}
