module "gke" {
  source                   = "terraform-google-modules/kubernetes-engine/google"
  version                  = "~> 29.0"
  project_id               = data.google_project.project.project_id
  name                     = var.cluster_name
  region                   = var.region
  zones                    = [var.zone]
  initial_node_count       = 1
  remove_default_node_pool = true
  network                  = "default"
  subnetwork               = "default"
  ip_range_pods            = ""
  ip_range_services        = ""
  cluster_resource_labels = {
    "mesh_id" : "proj-${data.google_project.project.number}",
  }
  identity_namespace = "${data.google_project.project.project_id}.svc.id.goog"
  deletion_protection = false

  monitoring_enable_managed_prometheus = false

  grant_registry_access = true

  node_pools = [
    {
      name         = "secretservice-node-pool"
      autoscaling  = true
      node_count   = 3
      min_count    = 1
      max_count    = 5
      auto_upgrade = true
      machine_type = "e2-medium"
    },
  ]

  depends_on = [
    module.enabled_google_apis
  ]
}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}