terraform {
  required_version = ">= 0.14"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.4"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.4"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}
provider "google-beta" {
  project = var.project
  region  = var.region
  zone    = var.zone
}