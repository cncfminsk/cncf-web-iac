module "projects_iam_bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 5.0"

  projects = [
    var.gcp_project
  ]
  bindings = var.iam_bindings
  
}