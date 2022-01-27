terraform {
    backend "s3" {
        bucket         = "dev-devsecops-demo-tfstate-management-bucket"
        key            = "terraform.tfstate"
        region         = "ap-northeast-1"
        dynamodb_table = "dev-devsecops-demo-tfstate-management-table"
    }
}
