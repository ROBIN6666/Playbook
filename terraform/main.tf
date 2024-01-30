provider "google" {
  credentials = file(var.GCP_CREDENTIALS)
  project     = "my-project-9248-412719"
  region      = "us-central1"
}

variable "GCP_CREDENTIALS" {
  description = "Path to the GCP key.json file"
  default     = "/app/key.json"  # Provide a default path or set it as per your needs
}

resource "google_container_cluster" "your-cluster" {
  name     = "your-cluster"
  location = "us-central1"

  # Other cluster configurations...

  node_pool {
    initial_node_count = 1
    # Other node pool configurations...
  }
}

output "gke_cluster_endpoint" {
  value       = google_container_cluster.your-cluster.endpoint
  description = "The endpoint for the GKE cluster"
}

output "gke_cluster_kubeconfig" {
  value       = google_container_cluster.your-cluster.master_auth[0].kubeconfig
  description = "The kubeconfig for connecting to the GKE cluster"
}
