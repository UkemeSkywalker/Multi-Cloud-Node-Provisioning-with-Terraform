resource "aws_instance" "nodes" {
  count         = var.node_count
  ami           = "ami-0c55b159cbfafe1f0" # Default Ubuntu 18.04 LTS AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id
  tags = {
    Name = "node-${random_integer.node_ids_aws.result}-${count.index}"
  }
  availability_zone = random_element(data.aws_availability_zones.available.names)
}

