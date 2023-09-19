#Remote backend state
terraform {
  backend "s3" {
    bucket = "dev-project-aws-santhosh-1-dummy"
    key    = "terraform.tfstate-remote-state"
    region = "ap-south-1"
    profile = "default"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

