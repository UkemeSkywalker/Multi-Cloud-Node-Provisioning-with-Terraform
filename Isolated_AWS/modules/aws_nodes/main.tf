data "aws_availability_zones" "available" {}

resource "random_integer" "node_ids_aws" {
  min = 100
  max = 999
}


resource "aws_instance" "supra_oracle_nodes" {
  count         = var.node_count
  ami           = "ami-0440d3b780d96b29d" # Default Ubuntu 18.04 LTS AMI
  instance_type = "t2.micro"
  subnet_id     = element(module.vpc.private_subnets, random_integer.node_ids_aws.result % 5)
  tags = {
    Name = "node-${random_integer.node_ids_aws.result}-${count.index}"
  }

}

