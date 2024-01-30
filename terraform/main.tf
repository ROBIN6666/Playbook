
provider "google" {
  credentials = file("path/to/your/gcp/key.json")
  project     = "your-gcp-project-id"
  region      = "us-central1"
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
