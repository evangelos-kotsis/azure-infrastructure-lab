# Azure Infrastructure Lab

A hands-on Azure infrastructure project built to demonstrate practical Cloud Engineering skills using Microsoft Azure, Terraform, Git, and GitHub.

## Project Goals

- Design and deploy Azure infrastructure using Infrastructure as Code.
- Build a secure and structured Azure network environment.
- Apply cloud security and cost-management best practices.
- Use Git and GitHub for version control and project documentation.
- Practice a professional infrastructure deployment workflow.

## Technologies

- Microsoft Azure
- Terraform
- Azure CLI
- Git
- GitHub
- Visual Studio Code

## Infrastructure Overview

This project deploys a foundational Azure networking environment
using Terraform (Infrastructure as Code).

### Azure Resources

- **Resource Group:** rg-azure-infrastructure-lab
- **Region:** North Europe
- **Virtual Network:** vnet-azure-infrastructure-lab
- **VNet Address Space:** 10.10.0.0/16
- **Subnet:** snet-app
- **Subnet Address Prefix:** 10.10.1.0/24
- **Network Security Group:** nsg-app

### Network Security

The Network Security Group (NSG) is associated with the application subnet.

A custom inbound security rule has been configured:

- **Rule Name:** Allow-HTTPS-Corporate
- **Direction:** Inbound
- **Protocol:** TCP
- **Destination Port:** 443 (HTTPS)
- **Source IP Range:** 203.0.113.0/24
- **Action:** Allow
- **Priority:** 100

**Security Note:** The source IP range 203.0.113.0/24 is reserved
for documentation and educational purposes. It does not represent
a real corporate network.

The NSG also retains Azure's default security rules.

## Deployment Instructions

### Prerequisites

Before deploying the infrastructure, ensure you have:

- An active Microsoft Azure subscription
- Terraform installed
- Azure CLI installed
- Permission to create resources in the Azure subscription

### Authenticate to Azure

```bash
az login
```

Verify the active Azure subscription:

```bash
az account show -o table
```

### Initialize Terraform

Navigate to the Terraform directory:

```bash
cd terraform
```

Initialize the Terraform working directory:

```bash
terraform init
```

### Validate the Configuration

```bash
terraform fmt -check
terraform validate
```

### Review the Deployment Plan

```bash
terraform plan
```

Review the proposed infrastructure changes before applying them.

### Deploy the Infrastructure

```bash
terraform apply
```

Confirm the deployment only after reviewing the Terraform plan.

### View Terraform Outputs

```bash
terraform output
```

### Destroy the Infrastructure

When the lab is no longer needed:

```bash
terraform destroy
```

**Warning:** This command deletes the infrastructure managed by
the current Terraform state. Always review the destruction plan
before confirming.