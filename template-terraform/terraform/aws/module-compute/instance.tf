resource "aws_security_group" "ec2" {
  name        = "${var.customer}-${var.project}-${var.env}"
  description = "Allow accessing the instance from the internet."
  vpc_id      = data.aws_subnet.selected.vpc_id

  tags = merge(local.merged_tags, {
    Name       = "${var.customer}-${var.project}-${var.env}"
  })
}

resource "aws_security_group_rule" "egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}

resource "aws_security_group_rule" "ingress-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}

resource "aws_security_group_rule" "ingress-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.debian.id
  instance_type = var.vm_instance_type

  vpc_security_group_ids = [aws_security_group.ec2.id]

  subnet_id               = data.aws_subnet.selected.id
  disable_api_termination = false

  root_block_device {
    volume_size           = var.vm_disk_size
    delete_on_termination = true
  }

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}"
    role = "ec2"
  })

  lifecycle {
    ignore_changes = [ami]
  }
}