output "provisioned_aws_nodes" {
  value = [
    for idx, instance in aws_instance.supra_oracle_nodes : {
      node_id = instance.tags.Name
      region  = substr(instance.availability_zone, 0, length(instance.availability_zone) - 1)
      zone    = instance.availability_zone
    }
  ]
}

# output "supra_subnet_id" {
#   value = module.vpc.private_subnets.id
# }