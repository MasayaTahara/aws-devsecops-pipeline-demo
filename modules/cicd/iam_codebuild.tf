resource "aws_iam_role" "cicd" {
  name               = "${var.codebuild_project_name}_role"
  path               = "/service-role/"
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
    sid    = "AllowAccessS3Web"
    effect = "Allow"
    actions = [
      # TODO: Restrict action
      "s3:*"
    ]
    resources = [
      var.bucket_arn,
      "${var.bucket_arn}/*",
    ]
  }
  statement {
    sid    = "AllowPutLogs"
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = [
      aws_cloudwatch_log_group.cicd.arn,
      "${aws_cloudwatch_log_group.cicd.arn}:*"
    ]
  }
}
