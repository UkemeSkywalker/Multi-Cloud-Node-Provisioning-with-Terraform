data "google_compute_zones" "available" {}

resource "random_integer" "node_ids_gcp" {
  min = 100
  max = 999
}

resource "google_compute_instance" "supra_nodes" {
  count        = var.node_count
  name         = "node-${random_integer.node_ids_gcp.result}-${count.index}"
  machine_type = "n1-standard-1"
  zone         = random_element(data.google_compute_zones.available.names)
  tags         = ["web", "app", "node"]

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

