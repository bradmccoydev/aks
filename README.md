# Microsoft Reactor Lab - AKS
This repository is for the Mircosoft Reactor Lab - Deploying .NET 5 Microservices to AKS using Terraform and Helm by Brad McCoy

# Blog Link
https://bradmccoydev.medium.com/deploying-net-5-microservices-to-aks-using-terraform-and-helm-f64d026b1569

# Get free azure account
https://azure.microsoft.com/en-us/free/

# Configure Azure for Terraform State File

Export variable with your own distinct name
``` export STORAGE_ACCOUNT_NAME=aksreactorlab123 ```

Create Resource Group
``` az group create --location australiaeast --name terraformstate ```

Create Storage Account
``` az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group terraformstate --location australiaeast --sku Standard_LRS ```

Create Storage Container
``` az storage container create --name reactorlab --account-name $STORAGE_ACCOUNT_NAME ```

Now the Storage account and container are created you need to update the terraform provider.tf with the values (storage_account_name, and container_name)

# Provision Infra with Terraform
Note: Im using terraform version 0.14.5

Export Access Key from storage account
``` export STORAGE_ACCOUNT_KEY=PCTyWoHuQajRkuD8+J7jqNjJEHZBEjiTtzpEzUzFcpn21MHLyW83ZCW2QFCebYgKThdXsJYvR8UE9CE6punWgg== ```

Initalize Terraform (replace <name> with storage account from above)
``` terraform init -backend-config="storage_account_name=$STORAGE_ACCOUNT_NAME" -backend-config="container_name=reactorlab" -backend-config="access_key=$STORAGE_ACCOUNT_KEY" -backend-config="key=aksreactorlab.tfstate" -upgrade ```

3. Terraform Plan
4. Terraform Validate & Apply

# Local Requirements
Terraform 0.14.5
Azure CLI
