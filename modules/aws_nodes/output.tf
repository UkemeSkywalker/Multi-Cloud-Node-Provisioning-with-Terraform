output "provisioned_aws_nodes" {
  value = [
    for idx, instance in aws_instance.nodes : {
      node_id = instance.tags.Name
      region  = substr(instance.availability_zone, 0, length(instance.availability_zone) - 1)
      zone    = instance.availability_zone
    }
  ]
}

output "supra_subnet_id" {
  value = aws_subnet.supra_subnet.id
}