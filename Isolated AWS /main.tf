provider "aws" {
  region     = "us-east-1" # Default region for AWS provider
}

module "aws_nodes" {
  source = "./modules/aws_nodes"
}

output "provisioned_nodes_report" {
  value = concat(module.aws_nodes.provisioned_aws_nodes)
}
