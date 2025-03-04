resource "helm_release" "nexus-repository" {
  name       = "nexus-repository"
  repository = "https://sonatype.github.io/helm3-charts"
  chart      = "nexus-repository-manager"

  set {
    name  = "persistence.storageSize"
    value = "${var.vm_disk_size}Gi"
  }

  set {
    name  = "nexus.security.randompassword"
    value = false
  }
}

data "kubernetes_ingress_v1" "nexus" {
  metadata {
    name = "nexus-repository-nexus-repository-manager"
  }
}