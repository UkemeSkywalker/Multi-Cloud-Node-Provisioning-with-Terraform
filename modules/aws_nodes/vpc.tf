# resource "aws_vpc" "supra_vpc" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "supra-vpc"
#   }
# }

# resource "aws_subnet" "supra_subnet_a" {
#   vpc_id            = aws_vpc.supra_vpc.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"
# }

# resource "aws_subnet" "supra_subnet_b" {
#   vpc_id            = aws_vpc.supra_vpc.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "us-east-1b"
# }

# resource "aws_subnet" "supra_subnet_c" {
#   vpc_id            = aws_vpc.supra_vpc.id
#   cidr_block        = "10.0.3.0/24"
#   availability_zone = "us-east-1c"
# }

# resource "aws_subnet" "supra_subnet_d" {
#   vpc_id            = aws_vpc.supra_vpc.id
#   cidr_block        = "10.0.4.0/24"
#   availability_zone = "us-east-1d"
# }

# resource "aws_subnet" "supra_subnet_e" {
#   vpc_id            = aws_vpc.supra_vpc.id
#   cidr_block        = "10.0.5.0/24"
#   availability_zone = "us-east-1e"
# }

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "supra-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]

  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}