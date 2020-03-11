# https://cloud.google.com/solutions/best-practices-vpc-design

resource "google_compute_network" "vpc_custom" {
  provider = google-beta
  project  = data.google_project.project.project_id
  name     = "cncf-msq-${var.GCP_ENV}"

  auto_create_subnetworks = false

}

resource "google_compute_subnetwork" "us-subnet" {
  depends_on               = [google_compute_network.vpc_custom]
  provider                 = google-beta
  name                     = "cncf-msq-${var.gcp_region_us}-${var.GCP_ENV}-subnet"
  ip_cidr_range            = cidrsubnet(lookup(var.region_subnets, var.gcp_region_us), var.newbits, var.cidrnetnum)
  region                   = var.gcp_region_us
  network                  = google_compute_network.vpc_custom.self_link
  private_ip_google_access = var.private_ip_google_access
}

resource "google_compute_subnetwork" "europe-subnet" {
  depends_on               = [google_compute_network.vpc_custom]
  provider                 = google-beta
  name                     = "cncf-msq-${var.gcp_region_eu}-${var.GCP_ENV}-subnet"
  ip_cidr_range            = cidrsubnet(lookup(var.region_subnets, var.gcp_region_eu), var.newbits, var.cidrnetnum)
  region                   = var.gcp_region_eu
  network                  = google_compute_network.vpc_custom.self_link
  private_ip_google_access = var.private_ip_google_access
}

resource "google_compute_global_address" "private_ip_address" {
  name          = "private-ip-address-${var.GCP_ENV}"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc_custom.self_link
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc_custom.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}


resource "google_compute_firewall" "allow-google-health-chk" {
  name    = "allow-google-health-chk"
  network = google_compute_network.vpc_custom.self_link

  allow {
    protocol = "all"
  }

  source_ranges = ["130.211.0.0/22", "35.191.0.0/16", "209.85.152.0/22", "209.85.204.0/22"]
}