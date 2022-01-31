![passing](https://github.com/bradmccoydev/aks/actions/workflows/ci.yml/badge.svg) ![GitHub](https://img.shields.io/github/license/bradmccoydev/aks)
# AKS Labs
This repo is used for our Azure Kubernetes Service Labs mostly in the Microsoft Reactor and Hashicorp community group

## Video Links
* [Hasicorp Community - Creating an AKS Cluster with Terraform](https://www.youtube.com/watch?v=K7Ku6p3nI_c)
* [Implementing Azure Front Door with Multi-Region AKS Clusters - Part 1](https://www.youtube.com/watch?v=wMwsCeFdwnI)
* [Implementing Azure Front Door with Multi-Region AKS Clusters - Part 2](https://www.youtube.com/watch?v=f4q1TqwsX_k)
* [Mircosoft Reactor Lab - Deploying .NET 5 Microservices to AKS](https://www.youtube.com/watch?v=BLu8swd2i_g)

## Blog Links
* [How to get Certified in Terraform](https://blog.bradmccoy.io/devops-journey-how-to-get-certified-in-terraform-c0bce1caa3d)
* [Deploying .NET Microservices using Terraform and Helm](https://blog.bradmccoy.io/deploying-net-5-microservices-to-aks-using-terraform-and-helm-f64d026b1569)

## Get free azure account
https://azure.microsoft.com/en-us/free/

## Configure Azure for Terraform State File
If you look at the src/provider.tf file. you will see that we are using an Azure backend to store state. If you want an Azure backend you can add a storage account with the commands below otherwise remove the backend params and you can use local state.

Export variable with your own distinct name
``` export STORAGE_ACCOUNT_NAME=aksreactorlab123 ```

Create Resource Group
``` az group create --location australiaeast --name terraformstate ```

Create Storage Account
``` az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group terraformstate --location australiaeast --sku Standard_LRS ```

Create Storage Container
``` az storage container create --name reactorlab --account-name $STORAGE_ACCOUNT_NAME ```

Now the Storage account and container are created you need to update the terraform provider.tf with the values (storage_account_name, and container_name)

## Provision Infra with Terraform

1. Terraform init
``` terraform init -var-file=deployment/demo.tfvars  ```

3. Terraform Plan
``` terraform plan -var-file=deployment/demo.tfvars ```

4. Terraform Apply
``` terraform apply -var-file=deployment/demo.tfvars ```

cd src && terraform init -var-file=deployment/ortelius/devops/prod.tfvars -backend-config="resource_group_name=devops-prod" -backend-config="storage_account_name=orteliusdevops" -backend-config="container_name=infrastate"
-backend-config="key=ortelius-devops.tfstate"

  backend "azurerm" {
    resource_group_name  = "devops-prod"
    storage_account_name = "or"
    container_name       = "moula-training"
    key                  = "hug-lab.tfstate"
  }

terraform plan -var-file=deployment/ortelius/devops/prod.tfvars 

terraform apply -var-file=deployment/ortelius/devops/prod.tfvars 