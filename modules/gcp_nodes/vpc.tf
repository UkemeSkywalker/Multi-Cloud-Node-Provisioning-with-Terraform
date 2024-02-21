module "network" {
  source  = "terraform-google-modules/network/google"
  version = "9.0.0"
  
  project_id   = "supra-oracle-nodes"
  network_name = "supra-oracles-vpc"

  subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-03"
            subnet_ip             = "10.10.30.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-04"
            subnet_ip             = "10.10.40.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-05"
            subnet_ip             = "10.10.50.0/24"
            subnet_region         = "us-west1"
        }
  ]
}