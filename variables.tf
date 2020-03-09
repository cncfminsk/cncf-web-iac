variable "GCP_PROJECT" {
  description = "Project ID"
}

variable "gcp_region" {
  description = "Default Region"
  default     = "europe-west4"
}

variable "gcp_region_us" {
  description = "Default Region"
  default     = "us-central1"
}

variable "gcp_region_eu" {
  description = "Default Region"
  default     = "europe-west4"
}

variable "region_zone_us" {
  default = "us-central1-a"
}

variable "region_zone_eu" {
  default = "europe-west4-d"
}

variable "region_zones_us" {
  type    = list
  default = ["us-central1-a", "us-central1-b", "us-central1-f"]
}

variable "region_zones_eu" {
  type    = list
  default = ["europe-west4-b", "europe-west4-c", "europe-west4-d"]
}

variable "GCP_ENV" {}

variable "region_subnets" {
  type = map

  default = {
    us-central1             = "10.80.0.0/16"
    northamerica-northeast1 = "10.81.0.0/16"
    europe-west4            = "10.82.0.0/16"
    asia-east2              = "10.83.0.0/16"
    australia-southeast1    = "10.84.0.0/16"
  }
}

variable "private_ip_google_access" {
  default = true
}

variable "CF_EMAIL" {}
variable "CF_API_TOKEN" {}

# network block
variable "newbits" { type = number }
variable "cidrnetnum" { type = number }


# Labels vars
variable "owner" {}
variable "environment" {}
variable "cost-center" {}
variable "region" {}
variable "contact" {}
variable "project" {}

variable "iam_bindings" {
  type = map
}