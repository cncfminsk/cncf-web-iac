module "projects_iam_bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 5.0"

  projects = [
    var.GCP_PROJECT
  ]
  bindings = var.iam_bindings

}

resource "google_service_account" "website-uploader" {
  account_id   = "website-uploader"
  display_name = "CNCF website uploader"
}

resource "google_service_account_key" "website-uploader" {
  service_account_id = "${google_service_account.website-uploader.name}"
}

resource "google_storage_bucket_iam_member" "dev-cncfminsk-io" {
  bucket = "dev.cncfminsk.io"
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.website-uploader.email}"
}

resource "google_storage_bucket_iam_member" "www-cncfminsk-io" {
  bucket = "www.cncfminsk.io"
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.website-uploader.email}"
}