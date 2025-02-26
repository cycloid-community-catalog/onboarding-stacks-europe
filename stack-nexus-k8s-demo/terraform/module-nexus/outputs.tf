output "nexus_port" {
  value = data.kubernetes_service.nexus-repository.spec.0.port.0.port
}
