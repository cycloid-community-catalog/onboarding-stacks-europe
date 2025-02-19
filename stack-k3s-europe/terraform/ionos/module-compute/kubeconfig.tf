resource "cycloid_credential" "kubeconfig" {
  name                   = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-kubeconfig"
  description            = "Kubeconfig file"
  path                   = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-kubeconfig"
  canonical              = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-kubeconfig"

  type = "basic_auth"
  body = {
    username = "kubeconfig"
    password = file("${path.module}/kubeconfig")
  }

  depends_on = [ ionoscloud_server.compute ]
}