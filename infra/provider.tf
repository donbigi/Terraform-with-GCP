# GCP Provider

provider "google" {
  credentials = file(var.gcp_svc_key) # Replace with the path to your service account key file
  project     = var.gcp_project       # Replace with your GCP Project ID
  region      = var.gcp_region        # Replace with your desired region
  zone        = var.gcp_zone          # Replace with your desired zone
}




