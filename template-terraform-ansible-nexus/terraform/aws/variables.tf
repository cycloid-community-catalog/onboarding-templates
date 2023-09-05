# Cycloid variables
variable "env" {}
variable "project" {}
variable "customer" {}

# AWS variables
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  description = "AWS region where to create servers."
  default     = "eu-west-1"
}
variable "keypair_public" {}