terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.28.0"
    }
  }
  required_version = "1.2.5"
}

provider "google" {
  project = var.project
  region = var.region
}