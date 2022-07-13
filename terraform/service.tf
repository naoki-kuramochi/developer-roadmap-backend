module "project-services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "v3.3.0"
  project_id = var.project

  activate_apis = ["cloudbuild.googleapis.com", "run.googleapis.com"]

  disable_services_on_destroy = false
}