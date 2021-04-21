# IAC for AKS
For the initial deployment using terraform it will take 10 minutes. This will deploy all networking, cluster, secrets and namespaces.

# CI/CD
This Repository is configured to use Azure DevOps pipelines.  The pipeline file can be found in the root directory azure-pipelines.yml

You will see that any pushes or pull requests to this repo on the main branch will trigger the pipeline.

There are 5 secrets configured as variables in the pipeline.

1. ssh_key 
This is used for the AKS Cluster used in kubernetes.tf

2. aks_service_prinipal_client_secret
This is the AKS service principal secret used in kubernetes.tf

3. CLOUDFLARE_API_TOKEN
This is for the cloudflare API token used to talk with cert manager

4. MONGODB_PASSWORD
Mongodb password used in the api app

5. postgres_password
Postgres password used in the backend

Tasks
1. Install our specific version of Terraform - 0.14.5
2. Terraform Init
3. Terraform Plan
4. Terraform Validate & Apply

# Local Requirements
Terraform 0.14.5
Azure CLI
