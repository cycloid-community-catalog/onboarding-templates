resource "aws_iam_role" "ssm-role" {
  name        = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  path        = "/"

  assume_role_policy = data.aws_iam_policy_document.assume-role.json
}

data "aws_iam_policy_document" "assume-role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_instance_profile" "ssm-profile" {
  name = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  role = aws_iam_role.ssm-role.name
}

resource "aws_iam_role_policy_attachment" "ssm-policy" {
  role       = aws_iam_role.ssm-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}