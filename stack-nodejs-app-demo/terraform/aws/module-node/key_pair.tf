resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {  
  key_name   = "${var.cyorg}-${var.cyproject}-${var.cyenv}"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "cycloid_credential" "key_pair" {
  name                   = "${var.cyorg}-${var.cyproject}-${var.cyenv}"
  description            = "SSH Key Pair used in newly provisionned workloads."
  path                   = "${var.cyorg}-${var.cyproject}-${var.cyenv}"
  canonical              = "${var.cyorg}-${var.cyproject}-${var.cyenv}"

  type = "ssh"
  body = {
    ssh_key = chomp(tls_private_key.ssh_key.private_key_openssh)
  }
}