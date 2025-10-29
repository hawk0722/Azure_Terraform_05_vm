# Terraform Sample

## Azure Resource

This includes of the following resources:

- Resource group
- Virtual network
- Network interface
- Virtual machine with p4d
- Virtual machine with p4p
- Network security group
- Bastion

## SystemConfiguration

![SystemConfiguration](/img/SystemConfiguration.svg)

## Instructions

Make sure have the [Azure CLI](https://learn.microsoft.com/ja-jp/cli/azure/install-azure-cli) and [Terraform](https://www.terraform.io/downloads)

1. Update terraform.tfvars with your desired values.

2. Run the following command.

```bash:bash
# Navigate to the directory containing main.tf
cd .\env\dev\ ; ls

# Log in to Azure
az login

# Retrieve your subscription ID
az account show --query id --output tsv

# Set the subscription ID as an environment variable
$env:ARM_SUBSCRIPTION_ID = "<your-subscription-id>"

# Initialize Terraform
terraform init

# Preview the execution plan
terraform plan

# Apply the configuration
terraform apply -auto-approve

# Destroy the resources
terraform destroy -auto-approve
```

```bash:bash
# Server settings.


```

## Notes

- The deployment was tested on windows.
