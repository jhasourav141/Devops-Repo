provider "google" {
  credentials = file("C:\\Users\\soura\\tactical-patrol-391403-cac29caa03de.json")
  project     = "tactical-patrol-391403"
  region      = "us-central1"
}

resource "google_container_cluster" "dev_gke_cluster" {
  name     = "my-gke-cluster"
  location = "us-central1"

  initial_node_count = 1

  master_auth {
    username = ""
    password = ""
  }

  node_pool {
    name       = "small-pool"
    machine_type  = "e2-small"
    initial_node_count = 1
    autoscaling {
      min_node_count = 1
      max_node_count = 10

      cpu_utilization {
        target = 80
      }
    }
    node_config {
      disk_size_gb = 100
    }
  }

  node_pool {
    name       = "medium-pool"
    machine_type  = "e2-medium"
    initial_node_count = 1
    autoscaling {
      min_node_count = 1
      max_node_count = 10
    }
    node_config {
      disk_size_gb = 100
    }
  }
}
