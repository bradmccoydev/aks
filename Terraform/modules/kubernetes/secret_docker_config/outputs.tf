output "name" {
  value       = kubernetes_secret.docker_registry.metadata.0.name
  description = "Secret Name"
}