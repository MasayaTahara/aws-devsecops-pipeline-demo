module "s3_web" {
  source      = "../../modules/s3-web"
  bucket_name = "devsecops-demo-website"
}

module "cicd" {
  source                        = "../../modules/cicd"
  codebuild_project_name        = "devsecops-demo-build"
  codebuild_project_description = "CodeBuild project for demo"
  logs_group_name               = "devsecops-demo-build-log"
  repository_url                = "https://github.com/MasayaTahara/devsecops-demo-app.git"
  bucket_arn                    = module.s3_web.bucket_arn
}
