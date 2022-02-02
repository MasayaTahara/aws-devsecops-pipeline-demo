resource "aws_s3_bucket" "web" {
  bucket = var.bucket_name
  # acl    = "public-read"
  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "web" {
  bucket = aws_s3_bucket.web.id
  policy = data.aws_iam_policy_document.allow_public_read.json
}

data "aws_iam_policy_document" "allow_public_read" {
  statement {
    sid    = "AllowPublicRead"
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "${aws_s3_bucket.web.arn}/*"
    ]
  }
}
