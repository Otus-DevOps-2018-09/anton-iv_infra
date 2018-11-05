
/*
module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.1.1"
  name    = ["storage-bucket-anton-iv-reddit"]
}

output storage-bucket_url {
  value = "${module.storage-bucket.url}"
}
*/
data "terraform_remote_state" "reddit" {
  backend = "gcs"
  config {
    bucket  = "storage-bucket-anton-iv-reddit"
    prefix  = "prod"
  }
}



terraform {
  backend "gcs" {
    bucket  = "storage-bucket-anton-iv-reddit"
    prefix  = "prod"
  }
}