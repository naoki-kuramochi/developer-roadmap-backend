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

resource "google_project_iam_member" "cloubuild" {
  project = var.project
  role    = "roles/run.admin"
  member  = "serviceAccount:${var.project_num}@cloudbuild.gserviceaccount.com"
}