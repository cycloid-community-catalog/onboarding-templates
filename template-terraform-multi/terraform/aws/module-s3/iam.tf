# data "aws_caller_identity" "current" {}

# resource "aws_iam_role" "this" {
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }

# data "aws_iam_policy_document" "bucket_policy" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = [aws_iam_role.this.arn]
#     }

#     actions = [
#       "s3:ListBucket",
#     ]

#     resources = [
#       "arn:aws:s3:::${var.s3_bucket_name}",
#     ]
#   }
# }