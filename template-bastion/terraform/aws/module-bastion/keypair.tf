resource "aws_key_pair" "infra" {
  key_name   = "${var.customer}-${var.project}-${var.env}-infra-key"
  public_key = var.keypair_public
}