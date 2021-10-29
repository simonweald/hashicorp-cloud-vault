provider "vault" {
  alias     = "admin"
  namespace = "admin"
}

resource "vault_namespace" "operations" {
  provider = vault.admin
  path     = "operations"
}

provider "vault" {
  alias     = "operations"
  namespace = "admin/operations"
}

resource "vault_namespace" "vpn" {
  depends_on = [vault_namespace.operations]
  provider   = vault.operations
  path       = "vpn"
}
