resource "aws_iam_role" "ci" {
  name               = "CodeBuildRole"
  assume_role_policy = data.aws_iam_policy_document.ci_assume_role.json
}

data "aws_iam_policy_document" "ci_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "ci" {
  role   = aws_iam_role.ci.name
  policy = data.aws_iam_policy_document.ci_role.json
}

data "aws_iam_policy_document" "ci_role" {
  statement {
    sid       = "AllowAccessCodeCommit"
    effect    = "Allow"
    actions   = ["codecommit:*"]
    resources = ["${var.repository_arn}"]
  }
  statement {
    sid     = "AllowAccessS3"
    effect  = "Allow"
    actions = ["s3:*"]
    resources = [
      "${var.bucket_arn}",
      "${var.bucket_arn}/*"
    ]
  }
}
