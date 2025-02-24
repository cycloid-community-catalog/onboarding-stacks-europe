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

# resource "null_resource" "password" {
#   provisioner "local-exec" {
#     working_dir = "./argocd"
#     command     = "kubectl -n argocd-staging get secret argocd-initial-admin-secret -o jsonpath={.data.password} | base64 -d > argocd-login.txt"
#   }
# }

# resource "null_resource" "del-argo-pass" {
#   depends_on = [null_resource.password]
#   provisioner "local-exec" {
#     command = "kubectl -n argocd-staging delete secret argocd-initial-admin-secret"
#   }
# }

resource "random_password" "argocd" {
  length           = 16
  special          = false
}

resource "cycloid_credential" "argocd" {
  name                   = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-admin-argocd"
  description            = "ArgoCD Admin password."
  path                   = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-admin-argocd"
  canonical              = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-admin-argocd"

  type = "basic_auth"
  body = {
    username = "admin"
    password = random_password.argocd.result
  }
}