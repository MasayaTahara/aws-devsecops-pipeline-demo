module "code_repository" {
  source                 = "../../modules/codecommit"
  repository_name        = "devsecops-demo-app"
  repository_description = "This is the Sample App Repository for DevSecOps"
}

module "s3_web" {
  source      = "../../modules/s3-web"
  bucket_name = "devsecops-demo-website"
}
