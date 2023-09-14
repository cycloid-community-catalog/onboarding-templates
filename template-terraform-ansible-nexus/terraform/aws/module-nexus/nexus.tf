resource "aws_security_group" "nexus" {
  name        = "${var.customer}-${var.project}-${var.env}-nexus"
  description = "Allow accessing the Nexus Repository service from the internet."
  vpc_id      = var.create_network ? try(module.vpc[0].vpc_id, null) : try(data.aws_subnet.selected[0].vpc_id, null)

  tags = merge(local.merged_tags, {
    Name       = "${var.customer}-${var.project}-${var.env}-nexus"
  })
}

resource "aws_security_group_rule" "egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nexus.id
}

resource "aws_security_group_rule" "ingress-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nexus.id
}

resource "aws_security_group_rule" "ingress-nexus" {
  type              = "ingress"
  from_port         = var.nexus_port
  to_port           = var.nexus_port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.nexus.id
}


resource "aws_instance" "nexus" {
  ami           = data.aws_ami.debian.id
  instance_type = var.vm_instance_type
  key_name      = aws_key_pair.nexus.key_name

  vpc_security_group_ids = [aws_security_group.nexus.id]

  subnet_id               = var.create_network ? try(module.vpc[0].public_subnets[0], null) : var.subnet_id
  disable_api_termination = false
  # associate_public_ip_address = true

  root_block_device {
    volume_size           = var.vm_disk_size
    delete_on_termination = true
  }

  tags = merge(local.merged_tags, {
    Name       = "${var.customer}-${var.project}-${var.env}-nexus"
    role       = "nexus"
  })

  lifecycle {
    ignore_changes = [ami]
  }
}