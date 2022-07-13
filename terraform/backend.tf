terraform {
  backend "gcs" {
    bucket = "ca-backend-division-sandbox-tf-state"
  }
}
