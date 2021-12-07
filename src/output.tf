output "kube_config" {
    value = format("%s%s%s%s","az aks get-credentials --resource-group ", "devops-prod", " --name ", "devops-ause-prod")
}
