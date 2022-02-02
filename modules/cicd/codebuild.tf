resource "aws_codebuild_project" "cicd" {
  name = var.codebuild_project_name
  description = var.codebuild_project_description
  service_role = aws_iam_role.cicd.arn

  build_timeout = "5"
  queued_timeout = "5"

  artifacts {
    type = "S3"
    packaging = "NONE"
    location = var.bucket_arn
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:5.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type = "CODECOMMIT"
    location = var.repository_name
  }
}
