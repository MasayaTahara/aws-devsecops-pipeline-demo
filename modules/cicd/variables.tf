variable "codebuild_project_name" {
  type        = string
  description = "CodeBuild Project Name"
}

variable "codebuild_project_description" {
  type        = string
  description = "CodeBuild Project Description"
}

variable "repository_url" {
  type        = string
  description = "Code Repository URL"
}

variable "bucket_arn" {
  type        = string
  description = "S3 Bucket ARN"
}

variable "logs_group_name" {
  type        = string
  description = "CloudWatch Logs Group Name for CodeBuild log"
}
