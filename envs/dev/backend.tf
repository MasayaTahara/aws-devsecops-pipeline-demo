# tfstate file is recommended to be managed by S3 and DynamoDB.
# However backend setting depends on also the scale of what will be created by Terraform.
# Therefore, backend setting is removed in this repository.

# terraform {
#     backend "s3" {
#         bucket         = ""
#         key            = ""
#         region         = ""
#         dynamodb_table = ""
#     }
# }
