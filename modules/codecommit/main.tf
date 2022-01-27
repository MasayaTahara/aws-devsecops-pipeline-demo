resource "aws_codecommit_repository" "demo" {
  repository_name = var.repository_name
  description     = var.repository_description
  default_branch  = "main"
}
