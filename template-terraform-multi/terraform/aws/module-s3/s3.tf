module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = var.s3_bucket_name

  tags = merge(local.merged_tags, {
    Name = "${var.customer}-${var.project}-${var.env}-storage"
    role = "storage"
  })

  # Bucket policies
  # attach_policy                            = true
  # policy                                   = data.aws_iam_policy_document.bucket_policy.json
  # attach_deny_insecure_transport_policy    = true
  # attach_require_latest_tls_policy         = true
  # attach_deny_incorrect_encryption_headers = true
  # attach_deny_incorrect_kms_key_sse        = true
  # allowed_kms_key_arn                      = aws_kms_key.objects.arn
  # attach_deny_unencrypted_object_uploads   = true

  # S3 Bucket Ownership Controls
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls
  # control_object_ownership = true
  # object_ownership         = "BucketOwnerPreferred"

  # acl = "private"

  # server_side_encryption_configuration = {
  #   rule = {
  #     apply_server_side_encryption_by_default = {
  #       kms_master_key_id = aws_kms_key.objects.arn
  #       sse_algorithm     = "aws:kms"
  #     }
  #   }
  # }
}