# Enable Cloud Resource Manager API
resource "google_project_service" "cloudresourcemanager" {
  project = var.GCP_PROJECT
  service = "cloudresourcemanager.googleapis.com"
}

# Enable Container Registry API
resource "google_project_service" "containerregistry" {
  project = var.GCP_PROJECT
  service = "containerregistry.googleapis.com"
}

# Enable GKE
resource "google_project_service" "container" {
  project = var.GCP_PROJECT
  service = "container.googleapis.com"
}

# Enable Service Networking API
resource "google_project_service" "servicenetworking" {
  project = var.GCP_PROJECT
  service = "servicenetworking.googleapis.com"
}

# Enable Cloudsql
# resource "google_project_service" "sqladmin" {
#   project = var.GCP_PROJECT
#   service = "sqladmin.googleapis.com"
# }

# Enable Memorystore
# resource "google_project_service" "redis" {
#   project = var.GCP_PROJECT
#   service = "redis.googleapis.com"
# }

# Enable IAM Service Account Credentials API
resource "google_project_service" "iamcredentials" {
  project = var.GCP_PROJECT
  service = "iamcredentials.googleapis.com"
}

# Enable Cloud Build API
resource "google_project_service" "cloudbuild" {
  project = var.GCP_PROJECT
  service = "cloudbuild.googleapis.com"
}

# Enable Compute Engine API
resource "google_project_service" "compute" {
  project = var.GCP_PROJECT
  service = "compute.googleapis.com"
}

# Enable OSlogin
resource "google_project_service" "oslogin" {
  project = var.GCP_PROJECT
  service = "oslogin.googleapis.com"
}

# # Enable AI Platform Training & Prediction API
# resource "google_project_service" "ml" {
#   project = var.GCP_PROJECT
#   service = "ml.googleapis.com"
# }         

resource "google_project_service" "servicecontrol" {
  project = var.GCP_PROJECT
  service = "servicecontrol.googleapis.com"
}

resource "google_project_service" "endpoints" {
  project = var.GCP_PROJECT
  service = "endpoints.googleapis.com"
}

#Enable identity toolkit API
resource "google_project_service" "identitytoolkit" {
  project = var.GCP_PROJECT
  service = "identitytoolkit.googleapis.com"
}