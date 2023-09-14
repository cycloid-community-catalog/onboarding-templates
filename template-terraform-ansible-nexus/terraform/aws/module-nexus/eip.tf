resource "aws_eip" "nexus" {
  instance = aws_instance.nexus.id
  domain   = "vpc"
}