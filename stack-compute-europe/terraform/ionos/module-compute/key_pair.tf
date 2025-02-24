resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "cycloid_credential" "ssh_key" {
  name                   = "${var.cy_org}-${var.cy_pro}-${var.cy_env}"
  description            = "SSH Key Pair used in newly provisionned workloads."
  path                   = "${var.cy_org}-${var.cy_pro}-${var.cy_env}"
  canonical              = "${var.cy_org}-${var.cy_pro}-${var.cy_env}"

  type = "ssh"
  body = {
    ssh_key = chomp(tls_private_key.ssh_key.private_key_openssh)
  }
}