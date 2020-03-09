module "projects_iam_bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 5.0"

  projects = [
    var.GCP_PROJECT
  ]
  bindings = var.iam_bindings
  
}