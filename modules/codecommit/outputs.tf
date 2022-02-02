output "repository_arn" {
  value = aws_codecommit_repository.demo.arn
  description = "Code Repository ARN"
}

output "repository_name" {
  value = aws_codecommit_repository.demo.repository_name
  description = "Code Repository Name"
}
