variable "codebuild_project_name" {
  type        = string
  description = "CodeBuild Project Name"
}

variable "codebuild_project_description" {
  type        = string
  description = "CodeBuild Project Description"
}

variable "repository_arn" {
  type        = string
  description = "Code Repository ARN"
}

variable "repository_name" {
  type        = string
  description = "Code Repository Name"
}

variable "bucket_arn" {
  type        = string
  description = "S3 Bucket ARN"
}
