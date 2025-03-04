output "nexus_host" {
  value = data.kubernetes_ingress_v1.example.status.0.load_balancer.0.ingress.0.hostname
}
