# Specify the provider and access details
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "<target bucket>"
    key    = "dev/terraform-dev1.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "global" {
    backend = "s3"

    config {
        bucket = "<target bucket>"
        key    = "ecs/terraform-ecs.tfstate"
        region = "us-east-1"
    }
}
