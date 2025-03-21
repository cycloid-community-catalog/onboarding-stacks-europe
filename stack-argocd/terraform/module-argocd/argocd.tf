resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  chart      = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  version    = var.argocd_version
  timeout    = "1500"

  namespace        = kubernetes_namespace.argocd.id
  create_namespace = true

  set {
    name  = "global.domain"
    value = "${var.cyorg}-${var.cypro}-${var.cyenv}-argocd.5.104.98.15.nip.io"
  }
  set {
    name  = "server.ingress.enabled"
    value = true
  }
  set {
    name  = "server.ingress.ingressClassName"
    value = "nginx"
  }
  set {
    name  = "configs.params.server.insecure"
    value = true
  }
  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = random_password.argocd.result
  }
  set {
    name  = "configs.repositories.private-repo.url"
    value = var.argocd_git_url
  }
  set {
    name  = "configs.credentialTemplates.private-repo.url"
    value = var.argocd_git_url
  }
  set {
    name  = "configs.credentialTemplates.private-repo.sshPrivateKey"
    value = var.argocd_git_key
  }
}

data "kubernetes_service" "argocd_server" {
 metadata {
   name      = "argocd-server"
   namespace = helm_release.argocd.namespace
 }
}

resource "random_password" "argocd" {
  length           = 16
  special          = false
}

resource "cycloid_credential" "argocd" {
  name                   = "${var.cyorg}-${var.cypro}-${var.cyenv}-admin-argocd"
  description            = "ArgoCD Admin password."
  path                   = "${var.cyorg}-${var.cypro}-${var.cyenv}-admin-argocd"
  canonical              = "${var.cyorg}-${var.cypro}-${var.cyenv}-admin-argocd"

  type = "basic_auth"
  body = {
    username = "admin"
    password = random_password.argocd.result
  }
}