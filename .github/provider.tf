terraform {
  required_version = ">=1.0.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.84.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "ringed-codex-398512"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "./keys.json"
}

