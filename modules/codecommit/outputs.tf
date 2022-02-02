output "repository_arn" {
  value = aws_codecommit_repository.demo.arn
  description = "Code Repository ARN"
}
