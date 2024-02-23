# Multi-Cloud-Node-Provisioning-with-Terraform
A Terraform script that provisions a network of nodes, assigning random node IDs, in both Google Cloud Platform (GCP) and Amazon Web Services (AWS).

There are 2 folders in this repo:
- GCP & AWS (still in beta phase, under testing)
- Isolated AWS (deploys 5 nodes to AWS exclusively)

For now, we would make our deployments from the Isolated AWS directory
Follow these steps.

1. Clone repo
`git clone https://github.com/UkemeSkywalker/Multi-Cloud-Node-Provisioning-with-Terraform.git`
2. Navigate to project directory: 
` cd Isolated_AWS`
3. Install AWS CLI [here] (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
4. Login to AWS console and create an AWS user access credentials for the CLI
5. Use `aws configure` to configure user credentials 
6. Run `aws sts get-caller-idenity` to confirm AWS user is mapped to the cli
7. Install terraform
```
 wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
 echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
 sudo apt update && sudo apt install terraform

```
8. Verify terraform is installed: `terraform -v`
9. Run bash script to make deployment: `./deploy.sh`
