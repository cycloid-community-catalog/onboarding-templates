resource "aws_eip" "nexus" {
  vpc = true
}

resource "aws_eip_association" "nexus" {
  allocation_id = aws_eip.nexus.id
  instance_id   = aws_instance.nexus.id
}