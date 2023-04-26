resource "aws_security_group" "webapp" {
  name        = "${var.customer}-${var.project}-${var.env}-webapp"
  description = "Allow accessing the instance from the internet."
  vpc_id      = module.vpc.vpc_id

  tags = merge(local.merged_tags, {
    Name       = "${var.customer}-${var.project}-${var.env}-webapp"
  })
}

resource "aws_security_group_rule" "egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webapp.id
}

resource "aws_security_group_rule" "ingress-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webapp.id
}

resource "aws_security_group_rule" "ingress-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.webapp.id
}

resource "aws_instance" "webapp" {
  ami           = data.aws_ami.debian.id
  instance_type = var.vm_instance_type

  vpc_security_group_ids = [aws_security_group.webapp.id]

  subnet_id               = module.vpc.public_subnets[0]
  disable_api_termination = false
  associate_public_ip_address = true

  root_block_device {
    volume_size           = var.vm_disk_size
    delete_on_termination = true
  }

  user_data_base64 = base64encode(templatefile(
    "${path.module}/userdata.sh.tpl",
    {
      git_app_url = var.git_app_url
    }
  ))

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}-webapp"
    role = "webapp"
  })

  lifecycle {
    ignore_changes = [ami]
  }
}