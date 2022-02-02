module "code_repository" {
  source                 = "../../modules/codecommit"
  repository_name        = "devsecops-demo-app"
  repository_description = "This is the Sample App Repository for DevSecOps"
}

module "s3_web" {
  source      = "../../modules/s3-web"
  bucket_name = "devsecops-demo-website"
}

module "cicd" {
  source                        = "../../modules/cicd"
  codebuild_project_name        = "devsecops-demo-build"
  codebuild_project_description = "CodeBuild project for demo"
  repository_arn                = module.code_repository.repository_arn
  repository_name               = module.code_repository.repository_name
  bucket_arn                    = module.s3_web.bucket_arn
}
