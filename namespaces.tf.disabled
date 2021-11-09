provider "vault" {
  address   = hcp_vault_cluster.hcp_vault.vault_public_endpoint_url
  token     = hcp_vault_cluster_admin_token.setup_token.token
  alias     = "admin"
  namespace = "admin"
}

resource "vault_namespace" "operations" {
  provider = vault.admin
  path     = "operations"
}

provider "vault" {
  address   = hcp_vault_cluster.hcp_vault.vault_public_endpoint_url
  token     = hcp_vault_cluster_admin_token.setup_token.token
  alias     = "operations"
  namespace = "admin/operations"
}

resource "vault_namespace" "vpn" {
  depends_on = [vault_namespace.operations]
  provider   = vault.operations
  path       = "vpn"
}
