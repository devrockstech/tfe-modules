# Variables for the google kubernetes


# Global variables
variable "cluster_name" {
    type = string
}
variable "location" {
    type = string
}
variable "region" {
    type = string
}
variable "project" {
    type = string
}
# ----------------------

# Existing network and subnetwork
variable "network" {
    type = string
}
variable "subnetwork" {
    type = string
}
# ----------------------

# Cluster variables
variable "master_version" {
    type = string
}
variable "node_version" {
    type = string
}
variable "initial_node_count" {
    type = number
}
variable "default_max_pods_per_node" {
    type = number
}
variable "max_node_count" {
    type = number
}
variable "min_node_count" {
    type = number
}
variable "machine_type" {
    type = string
}
variable "image_type" {
    type = string
}
variable "disk_type" {
    type = string
}
variable "disk_size_gb" {
    type = string
}
variable "node_locations"{
    type = list
}
variable "oauth_scopes"{
    type = list
}
variable "istio" {
  description = "(Beta) Enable Istio addon"
}
variable "istio_auth" {
  type        = string
  description = "(Beta) The authentication type between services in Istio."
}
variable "enable_shielded_nodes" {
  type        = bool
  description = "Enable Shielded Nodes features on all nodes in this cluster"
}
variable "enable_vertical_pod_autoscaling" {
  type        = bool
  description = "Vertical Pod Autoscaling automatically adjusts the resources of pods controlled by it"
}
variable "enable_legacy_abac" {
  type = string
  description = "When enabled, identities in the system, including service accounts, nodes, and controllers, will have statically granted permissions beyond those provided by the RBAC configuration or IAM. Defaults to false"
}
variable "enable_private_endpoint" {
  type        = bool
  description = "(Beta) Whether the master's internal IP address is used as the cluster endpoint"
}
variable "enable_private_nodes" {
  type        = bool
  description = "(Beta) Whether nodes have internal IP addresses only"
}
variable "master_ipv4_cidr_block" {
  type        = string
  description = "(Beta) The IP range in CIDR notation to use for the hosted master network"
}
variable "master_authorized_networks" {
  type        = list(object({ cidr_block = string, display_name = string }))
  description = "List of master authorized networks. If none are provided, disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
}
#variable "ip_range_pods" {
#  type        = string
#  description = "The _name_ of the secondary subnet ip range to use for pods"
#}

#variable "ip_range_services" {
#  type        = string
#  description = "The _name_ of the secondary subnet range to use for services"
#}
# ------------------------------------

# Logging and monitoring
variable "logging_service" {
 type        = string
 description = "The logging service that the cluster should write logs to. Available options include logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none"
}

variable "monitoring_service" {
 type        = string
 description = "The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none"
}
# ---------------------------

# Tags and labels
variable "labels" {
    type = map
}
variable "tags"{
    type = list
}
# ----------------------
variable "chart_url" {
  type = string
}
