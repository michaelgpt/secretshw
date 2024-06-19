data "google_project" "project" {
  project_id = var.project
}

data "google_client_config" "default" {}

module "enabled_google_apis" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.5.0"

  project_id                  = data.google_project.project.project_id
  disable_services_on_destroy = false

  activate_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "gkehub.googleapis.com",
    "gkeconnect.googleapis.com",
    "mesh.googleapis.com",
    "meshconfig.googleapis.com",
    "meshtelemetry.googleapis.com",
  ]
}