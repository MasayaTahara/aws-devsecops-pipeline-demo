resource "aws_cloudwatch_log_group" "cicd" {
  name = var.logs_group_name
}
