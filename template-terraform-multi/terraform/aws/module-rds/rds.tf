resource "random_password" "password" {
  length = 16
  special = true
  override_special = "-_"
}

resource "aws_db_subnet_group" "rds" {
  name       = "${var.customer}-${var.project}-${var.env}-subnetgroup"
  subnet_ids = data.aws_subnets.private.ids

  tags = merge(local.merged_tags, {
    Name       = "${var.customer}-${var.project}-${var.env}-subnetgroup"
    role       = "subnetgroup"
  })
}

resource "aws_db_instance" "rds" {
  identifier             = "rds-${var.rds_engine}-${var.customer}-${var.project}-${var.env}"
  instance_class         = var.rds_instance_class
  allocated_storage      = var.rds_allocated_storage
  engine                 = var.rds_engine
  username               = var.rds_username
  password               = random_password.password.result
  db_name                = var.rds_database_name
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  multi_az               = false
  publicly_accessible    = false
  skip_final_snapshot    = true
  apply_immediately      = true

  tags = merge(local.merged_tags, {
    Name        = "rds-${var.rds_engine}-${var.customer}-${var.project}-${var.env}"
    Environment = var.env
    role        = "rds"
  })
}