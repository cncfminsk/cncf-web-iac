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
  version     = "~> 3.5.0"
  credentials = file("~/.config/gcloud/${var.gcp_project}.json")
  project     = var.gcp_project
  region      = var.gcp_region
}

provider "google-beta" {
  version     = "~> 3.5.0"
  credentials = file("~/.config/gcloud/${var.gcp_project}.json")
  project     = var.gcp_project
  region      = var.gcp_region
}

terraform {
  backend "gcs" {
    credentials = "~/.config/gcloud/helpful-way-259300.json"
    bucket      = "helpful-way-259300-tfstate"
    prefix      = "project"
  }
}

provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cf_email
  api_key = var.cf_api_token
}
