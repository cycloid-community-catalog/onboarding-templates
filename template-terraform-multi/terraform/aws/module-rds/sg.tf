resource "aws_security_group" "rds" {
  vpc_id      = var.vpc_id
  name        = "${var.customer}-${var.project}-${var.env}-sg-rds"
  description = "Allow all inbound for PostgreSQL"
  # Adding rule for MySQL
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.29.0.0/16", "10.56.0.0/14"]
  }
  # Adding rule for PostgreSQL
  ingress {
    from_port   = 5432
    to_port     = 5433
    protocol    = "tcp"
    cidr_blocks = ["10.29.0.0/16", "10.56.0.0/14"]
  }
}