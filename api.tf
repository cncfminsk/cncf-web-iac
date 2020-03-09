# Enable Cloud Resource Manager API
resource "google_project_service" "cloudresourcemanager" {
  project = var.gcp_project
  service = "cloudresourcemanager.googleapis.com"
}

# Enable Container Registry API
resource "google_project_service" "containerregistry" {
  project = var.gcp_project
  service = "containerregistry.googleapis.com"
}

# Enable GKE
resource "google_project_service" "container" {
  project = var.gcp_project
  service = "container.googleapis.com"
}

# Enable Service Networking API
resource "google_project_service" "servicenetworking" {
  project = var.gcp_project
  service = "servicenetworking.googleapis.com"
}

# Enable Cloudsql
# resource "google_project_service" "sqladmin" {
#   project = var.gcp_project
#   service = "sqladmin.googleapis.com"
# }

# Enable Memorystore
# resource "google_project_service" "redis" {
#   project = var.gcp_project
#   service = "redis.googleapis.com"
# }

# Enable IAM Service Account Credentials API
resource "google_project_service" "iamcredentials" {
  project = var.gcp_project
  service = "iamcredentials.googleapis.com"
}

# Enable Cloud Build API
resource "google_project_service" "cloudbuild" {
  project = var.gcp_project
  service = "cloudbuild.googleapis.com"
}

# Enable Compute Engine API
resource "google_project_service" "compute" {
  project = var.gcp_project
  service = "compute.googleapis.com"
}

# Enable OSlogin
resource "google_project_service" "oslogin" {
  project = var.gcp_project
  service = "oslogin.googleapis.com"
}

# # Enable AI Platform Training & Prediction API
# resource "google_project_service" "ml" {
#   project = var.gcp_project
#   service = "ml.googleapis.com"
# }         

resource "google_project_service" "servicecontrol" {
  project = var.gcp_project
  service = "servicecontrol.googleapis.com"
}         

resource "google_project_service" "endpoints" {
  project = var.gcp_project
  service = "endpoints.googleapis.com"
}         

#Enable identity toolkit API
resource "google_project_service" "identitytoolkit" {
  project = var.gcp_project
  service = "identitytoolkit.googleapis.com"
}