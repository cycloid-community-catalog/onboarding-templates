resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {  
  key_name   = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "cycloid_credential" "ssh_key" {
  name                   = "${var.cy_project}-${var.cy_env}-compute-ssh"
  description            = "SSH Key Pair used in newly provisionned workloads."
  path                   = "${var.cy_project}-${var.cy_env}-compute-ssh"
  canonical              = "${var.cy_project}-${var.cy_env}-compute-ssh"

  type = "ssh"
  body = {
    ssh_key = chomp(tls_private_key.ssh_key.private_key_openssh)
  }
}