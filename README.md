<img width="3000" height="1600" alt="image-1794934076424" src="https://github.com/user-attachments/assets/fbd24b0a-2e65-4616-86b5-d9105a161cf6" />
<img width="3000" height="1600" alt="image-1794934068625" src="https://github.com/user-attachments/assets/0306d811-5380-4a4f-bb12-664335982127" />

# Multi-Cloud Node Provisioning with Terraform

Infrastructure-as-Code project exploring automated node provisioning across Amazon Web Services (AWS) and Google Cloud Platform (GCP) using Terraform.

The repository contains separate implementations for AWS-only provisioning and an experimental AWS/GCP configuration.

## Project Structure

```text
.
├── GCP & AWS/
│   └── # Experimental multi-cloud implementation
│
├── Isolated_AWS/
│   ├── main.tf
│   └── modules/
│       └── aws_nodes/
│           ├── main.tf
│           ├── variables.tf
│           └── vpc.tf
│
└── README.md
```

## Current Implementations

### 1. AWS Node Provisioning

The `Isolated_AWS` configuration provisions an AWS network and a configurable number of EC2 instances.

The current implementation includes:

- AWS provider configuration in `us-east-1`.
- A VPC using CIDR range `10.0.0.0/16`.
- Five private subnets distributed across five Availability Zones.
- A VPN gateway enabled on the VPC.
- EC2 instance provisioning through a reusable Terraform module.
- A configurable node count, defaulting to five instances.
- Randomised node identifiers used in instance naming.

### 2. AWS and GCP Provisioning

The `GCP & AWS` directory contains the experimental multi-cloud implementation.

This part of the project is still under development and should be treated as a work in progress rather than a production-ready multi-cloud deployment.

## Technology Stack

| Component | Technology |
|---|---|
| Infrastructure as Code | Terraform |
| Cloud providers | AWS, GCP (experimental path) |
| Compute | Amazon EC2 |
| Networking | Amazon VPC |
| Terraform modules | terraform-aws-modules/vpc/aws |

## Prerequisites

For the AWS implementation:

- Terraform installed.
- AWS CLI installed and configured.
- An AWS account with permissions to provision EC2, VPC and related networking resources.
- Appropriate AWS credentials.

Prefer AWS IAM Identity Center, an assumed role, or another short-lived credential mechanism instead of hardcoding access keys.

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/UkemeSkywalker/Multi-Cloud-Node-Provisioning-with-Terraform.git

cd Multi-Cloud-Node-Provisioning-with-Terraform
```

### 2. Configure AWS credentials

Configure your AWS CLI using your organisation's approved authentication method.

Verify the active identity:

```bash
aws sts get-caller-identity
```

### 3. Navigate to the AWS implementation

```bash
cd Isolated_AWS
```

### 4. Initialise Terraform

```bash
terraform init
```

### 5. Validate the configuration

```bash
terraform fmt -recursive
terraform validate
```

### 6. Review the deployment plan

```bash
terraform plan
```

### 7. Provision the infrastructure

After reviewing the plan and confirming the expected resources:

```bash
terraform apply
```

## Configuration

The AWS node module exposes a `node_count` variable.

Its current default is:

```hcl
variable "node_count" {
  description = "Number of nodes to provision"
  type        = number
  default     = 5
}
```

Adjust the default or expose the variable through the root module to customise the number of instances.

## Important Notes

- The AWS implementation currently provisions EC2 instances; it does not install or configure a blockchain node software client.
- The AWS/GCP implementation is experimental.
- Review the AMI, Terraform provider and module versions before deployment.
- Review subnet routing and connectivity requirements before deploying workloads into the private subnets.
- Review AWS costs before applying the configuration.
- The configuration should be validated and tested in a non-production AWS account before wider use.

## Future Improvements

- Complete and validate the AWS/GCP implementation.
- Add configurable instance types, regions and operating system images.
- Add cloud-specific modules with reusable inputs and outputs.
- Add node bootstrap and configuration management.
- Add remote Terraform state and state locking.
- Add automated Terraform validation and security scanning.
- Add deployment and teardown documentation.

## License

See the repository for licensing information.
