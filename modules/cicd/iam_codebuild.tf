resource "aws_iam_role" "cicd" {
  name               = "CodeBuildRole"
  assume_role_policy = data.aws_iam_policy_document.cicd_assume_role.json
}

data "aws_iam_policy_document" "cicd_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "cicd" {
  role   = aws_iam_role.cicd.name
  policy = data.aws_iam_policy_document.cicd_role.json
}

data "aws_iam_policy_document" "cicd_role" {
  statement {
    sid       = "AllowAccessCodeCommit"
    effect    = "Allow"
    actions   = ["codecommit:*"]
    resources = [var.repository_arn]
  }
  statement {
    sid     = "AllowAccessS3"
    effect  = "Allow"
    actions = ["s3:*"]
    resources = [
      var.bucket_arn,
      "${var.bucket_arn}/*"
    ]
  }
}
