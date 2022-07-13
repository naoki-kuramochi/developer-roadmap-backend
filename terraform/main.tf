resource "google_cloudbuild_trigger" "deploy" {
  name = "deploy"
  trigger_template {
    branch_name = "master"
    repo_name   = "naoki-kuramochi/developer-roadmap-backend"
  }

  substitutions = {
    _SERVICE_NAME = "backend-loadmap"
    _REGION = var.region
  }

  filename = "cloudbuild.yaml"
}

module "projects_iam_bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "7.4.1"

  projects = [var.project]

  bindings = {
    "roles/run.admin" = [
      "serviceAccount:${var.project_num}@cloudbuild.gserviceaccount.com"
    ]

    "roles/iam.serviceAccountUser" = [
      "serviceAccount:${var.project_num}@cloudbuild.gserviceaccount.com"
    ]
  }
}