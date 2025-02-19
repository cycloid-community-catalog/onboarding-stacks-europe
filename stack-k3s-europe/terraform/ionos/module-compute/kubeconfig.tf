resource "time_sleep" "wait_60_seconds" {
  depends_on = [ionoscloud_server.compute]

  create_duration = "60s"
}

resource "null_resource" "kubeconfig" {
  connection {
    type        = "ssh"
    user        = "root"
    private_key = tls_private_key.ssh_key.private_key_openssh
    host        = ionoscloud_server.compute.primary_ip
  }

  provisioner "file" {
    source      = "/etc/rancher/k3s/k3s.yaml"
    destination = "kubeconfig"

  }

  depends_on = [time_sleep.wait_60_seconds]
}

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

  depends_on = [
    null_resource.kubeconfig
  ]
}