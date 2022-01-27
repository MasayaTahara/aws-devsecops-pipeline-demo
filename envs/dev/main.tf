module "tfstate_manager_module" {
    source = "github.com/MasayaTahara/tfstate-manager"
    env    = "dev"
    app    = "devsecops-demo"
}

module "code_repository" {
  source                 = "../../modules/codecommit"
  repository_name        = "devsecops-demo-app"
  repository_description = "This is the Sample App Repository for DevSecOps"
}
