module "code_repository" {
  source                 = "../../modules/codecommit"
  repository_name        = "devsecops-demo-app"
  repository_description = "This is the Sample App Repository for DevSecOps"
}
