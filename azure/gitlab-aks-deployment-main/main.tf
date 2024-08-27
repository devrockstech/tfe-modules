# ----------- Main resources for deployment -----------

# Existing azure client config
data "azurerm_client_config" "current" {}

# Existing resource group
data "azurerm_resource_group" "aks" {
  name = var.resource_group_name
}

# Create azure kubernetes cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                      = var.cluster_name
  location                  = var.location
  resource_group_name       = data.azurerm_resource_group.aks.name
  dns_prefix                = var.dns_prefix
  automatic_channel_upgrade = "stable"
  sku_tier                  = "Standard"
  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = data.azurerm_key_vault_secret.ssh_key.value

    }
  }
  # Create node pools, more than one if you want
  dynamic "default_node_pool" {
    for_each = var.agent_pools
    content {
      name                = default_node_pool.value.name
      node_count          = default_node_pool.value.count
      vm_size             = default_node_pool.value.vm_size
      os_disk_type        = default_node_pool.value.os_disk_type
      os_disk_size_gb     = default_node_pool.value.os_disk_size_gb
      type                = "VirtualMachineScaleSets"
      enable_auto_scaling = default_node_pool.value.enable_auto_scaling
      min_count           = default_node_pool.value.min_count
      max_count           = default_node_pool.value.max_count
      max_pods            = default_node_pool.value.max_pods
      tags                = var.tags
      vnet_subnet_id      = data.azurerm_subnet.aks.id
    }
  }
  node_resource_group              = var.node_resource_group_name
  kubernetes_version               = "1.28"
  http_application_routing_enabled = false
  private_cluster_enabled          = false

  service_principal {
    client_id     = data.azurerm_key_vault_secret.client_id.value
    client_secret = data.azurerm_key_vault_secret.client_secret.value
  }

  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.load_balancer_sku
    service_cidr      = var.service_cidr
    dns_service_ip    = var.dns_service_ip
    network_policy    = var.network_policy
  }
  tags = var.tags
}
