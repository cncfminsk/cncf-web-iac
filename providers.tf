data "google_client_config" "current" {}

data "cloudflare_zones" "cncfminsk-io" {
  filter {
    name   = "cncfminsk.io"
    status = "active"
    paused = false
  }
}

data "google_client_config" "default" {
}

data "google_project" "project" {}

provider "google" {
  version = "~> 3.5.0"
  project = var.GCP_PROJECT
  region  = var.gcp_region
}

provider "google-beta" {
  version = "~> 3.5.0"
  project = var.GCP_PROJECT
  region  = var.gcp_region
}

terraform {
  backend "gcs" {
    prefix = "project"
  }
}

provider "cloudflare" {
  version = "~> 2.0"
  email   = var.CF_EMAIL
  api_key = var.CF_API_TOKEN
}

