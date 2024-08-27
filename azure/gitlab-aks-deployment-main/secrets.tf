# -------------- Fetching the secrets from keyvault -----------------


# Existing key vault
data "azurerm_key_vault" "keyvault" {
    name = "k8svaultapp"
    resource_group_name = "dev-eus-rg"
}

# Existing Vault Secret for client id
data "azurerm_key_vault_secret" "client_id" {
name = "spnclinetid"
key_vault_id = data.azurerm_key_vault.keyvault.id
# vault_uri = "https://mlkv01.vault.azure.net/"
}

# Existing Vault Secret for client secret
data "azurerm_key_vault_secret" "client_secret" {
name = "spnclientsecret"
key_vault_id = data.azurerm_key_vault.keyvault.id
# vault_uri = "https://mlkv01.vault.azure.net/"
}

# Existing Vault Secret for tenant id
data "azurerm_key_vault_secret" "tenant_id" {
name = "tenantid"
key_vault_id = data.azurerm_key_vault.keyvault.id
# vault_uri = "https://mlkv01.vault.azure.net/"
}

# Existing Vault Secret for client app id
data "azurerm_key_vault_secret" "client_app_id" {
name = "aadappclientid"
key_vault_id = data.azurerm_key_vault.keyvault.id
# vault_uri = "https://mlkv01.vault.azure.net/"
}

# Existing Vault Secret for server app id
data "azurerm_key_vault_secret" "server_app_id" {
name = "aadappserverid"
key_vault_id = data.azurerm_key_vault.keyvault.id
# vault_uri = "https://mlkv01.vault.azure.net/"
}

# Existing Vault Secret for server app secret
data "azurerm_key_vault_secret" "server_app_secret" {
name = "aadserversecret"
key_vault_id = data.azurerm_key_vault.keyvault.id
# vault_uri = "https://mlkv01.vault.azure.net/"
}

# Existing Vault Secret for ssh key
data "azurerm_key_vault_secret" "ssh_key" {
name = "sshrsa1"
key_vault_id = data.azurerm_key_vault.keyvault.id
# vault_uri = "https://mlkv01.vault.azure.net/"
}