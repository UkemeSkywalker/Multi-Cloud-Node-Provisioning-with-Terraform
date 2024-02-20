# modules/gcp_nodes/main.tf

variable "node_count" {
  description = "Number of nodes to provision"
  type        = number
}

resource "google_compute_instance" "nodes" {
  count        = var.node_count
  name         = "node-${random_integer.node_ids_gcp.result}-${count.index}"
  machine_type = "n1-standard-1"
  zone         = random_element(data.google_compute_zones.available.names)
  tags         = ["web", "app"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

output "provisioned_gcp_nodes" {
  value = [
    for idx, instance in google_compute_instance.nodes : {
      node_id = instance.name
      region  = split("-", instance.zone)[0]
      zone    = instance.zone
    }
  ]
}
