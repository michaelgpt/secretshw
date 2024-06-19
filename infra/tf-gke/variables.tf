variable "project" {
  type        = string
  description = "GCP project provided by Storj for hw"
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "zone" {
  type        = string
  description = "GCP zone in the region"
}

variable "cluster_name" {
  type        = string
  description = "the name of cluster"
}