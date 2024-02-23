provider "google" {
  credentials = file("path/to/google-credentials.json")
}

provider "aws" {
  region     = "us-east-1" # Default region for AWS provider
}

module "gcp_nodes" {
  source     = "./modules/gcp_nodes"

}

module "aws_nodes" {
  source = "./modules/aws_nodes"
}

output "provisioned_nodes_report" {
  value = concat(module.aws_nodes.provisioned_aws_nodes, module.gcp_nodes.provisioned_gcp_nodes)
}
