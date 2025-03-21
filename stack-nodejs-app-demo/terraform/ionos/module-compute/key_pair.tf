resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "cycloid_credential" "ssh_key" {
  name                   = "${var.cyorg}-${var.cypro}-${var.cyenv}-compute-ssh"
  description            = "SSH Key Pair used in newly provisionned workloads."
  path                   = "${var.cyorg}-${var.cypro}-${var.cyenv}-compute-ssh"
  canonical              = "${var.cyorg}-${var.cypro}-${var.cyenv}-compute-ssh"

  type = "ssh"
  body = {
    ssh_key = chomp(tls_private_key.ssh_key.private_key_openssh)
  }
}