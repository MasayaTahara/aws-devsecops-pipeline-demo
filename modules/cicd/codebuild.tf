resource "aws_codebuild_project" "cicd" {
  name         = var.codebuild_project_name
  description  = var.codebuild_project_description
  service_role = aws_iam_role.cicd.arn

  build_timeout  = "5"
  queued_timeout = "5"

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:5.0"
    type         = "LINUX_CONTAINER"
  }

  source {
    type            = "GITHUB"
    location        = var.repository_url
    git_clone_depth = "1"
  }

  logs_config {
    cloudwatch_logs {
      group_name = aws_cloudwatch_log_group.cicd.name
    }
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }
}

# You have to authorize CodeBuild with GitHub in AWS console
# If you do not, you will get following error:
# Error: error creating CodeBuild Webhook: ResourceNotFoundException: Could not find access token for server type github
resource "aws_codebuild_webhook" "cicd" {
  project_name = aws_codebuild_project.cicd.name
  build_type   = "BUILD"

  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PUSH"
    }
    filter {
      type    = "HEAD_REF"
      pattern = "main"
    }
  }
}
