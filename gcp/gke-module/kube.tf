# data "google_client_config" "provider" {}

# provider "helm" {
#   kubernetes {
#     host                   = "https://${google_container_cluster.primary.endpoint}"
#     cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
#     token = data.google_client_config.provider.access_token
#   }
# }

# resource "helm_release" "defender" {
#   name       = "twistlock"
#   chart      = var.chart_url
#   create_namespace = true

# }


