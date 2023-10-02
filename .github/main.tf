resource "google_cloud_run_service" "cloud-run-with-tf" {
  name     = "cloud-run-with-tf"
  location = "us-central1"

  template {
    spec {
      containers {
        #image = "gcr.io/striped-bastion-375620/cloudrun:latest"
        image = "gcr.io/striped-bastion-375620/cloudrun:V5"
      }
    }
  }

  traffic {
    percent         = 50
    revision_name = "cloud-run-with-tf-8cfkd"
  }

  traffic {
    percent         = 50
revision_name = "cloud-run-with-tf-cmltv"
  }
}

resource "google_cloud_run_service_iam_policy" "policy-tf" {
  
  project = google_cloud_run_service.cloud-run-with-tf.project
  service = google_cloud_run_service.cloud-run-with-tf.name
  location = google_cloud_run_service.cloud-run-with-tf.location
  policy_data = data.google_iam_policy.pub1.policy_data
}

data "google_iam_policy" "pub1" {
  binding {
    role = "roles/run.invoker"
    members = ["allUsers"]
  }
}