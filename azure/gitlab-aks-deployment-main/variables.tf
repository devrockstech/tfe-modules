# --------- Adding all the variables in this deployment ----------

# Cluster variables
variable "network_plugin" {
  description = "The network plugin"
}
variable "load_balancer_sku" {
  description = "Load balancer size"
}
variable "service_cidr" {
  description = "Service cidr"
}
variable "dns_service_ip" {
  description = "Dns service IP"
}

variable "network_policy" {
  description = "Network policy"
}

variable "agent_count" {
  description = "Numbers of node"
}

variable "admin_username" {
  description = "Admin user name"
}

variable "dns_prefix" {
  description = "Dns prefix of the cluster"
}

variable "cluster_name" {
  description = "Cluster name"
}

variable "resource_group_name" {
  description = "Resource group of the deployment"
}

variable "location" {
  description = "Location of cluster"
}
# -------------------------

# Agent pools variables
variable "agent_pools" {
  description = "(Optional) List of agent_pools profile for multiple node pools"
  type = list(object({
    name    = string
    count   = number
    vm_size = string
    os_disk_type             = string
    os_disk_size_gb = number
    max_pods        = number
    enable_auto_scaling = bool
    min_count           = number
    max_count           = number
  }))
}
# -------------------------

# Resource group for the node resources
variable "node_resource_group_name" {
  description = "The resource group of the node"
}
# -------------------------

# Existing virtual network and subnet
variable "azurerm_virtual_network_name" {
  description = "The existing virtual network"
}

variable "azurerm_virtual_network_rg" {
  description = "The resource group of the virtual network"
}

variable "azurerm_subnet_name" {
  description = "The existing subnet"
}
# ---------------------------

# Tags
variable "tags" {
  type        = map(any)
  description = "Tags for all the resources"

}
# -----------------
