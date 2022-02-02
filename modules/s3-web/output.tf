output "bucket_arn" {
  value       = aws_s3_bucket.web.arn
  description = "S3 Bucket ARN"
}
