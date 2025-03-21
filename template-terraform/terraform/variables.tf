# Cycloid variables
variable "cy_org" {}
variable "cy_pro" {}
variable "cy_env" {}
variable "cy_com" {}

# AWS variables
variable "aws_cred" {
  description = "Contains AWS access_key and secret_key"
}
variable "aws_region" {
  description = "AWS region where to create servers."
  default     = "eu-west-1"
}