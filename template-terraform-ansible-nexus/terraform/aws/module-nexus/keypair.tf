resource "aws_key_pair" "nexus" {
  key_name   = "${var.customer}-${var.project}-${var.env}-nexus-key"
  public_key = var.keypair_public
}