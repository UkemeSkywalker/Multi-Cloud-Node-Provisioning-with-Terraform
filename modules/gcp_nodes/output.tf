output "provisioned_gcp_nodes" {
  value = [
    for idx, instance in google_compute_instance.supra_nodes : {
      node_id = instance.name
      region  = split("-", instance.zone)[0]
      zone    = instance.zone
    }
  ]
}