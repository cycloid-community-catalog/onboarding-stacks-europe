output "cluster_ip" {
    value = data.kubernetes_service.argocd_server.cluster_ip
}

output "external_name" {
    value = data.kubernetes_service.argocd_server.external_name
}