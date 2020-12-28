terraform {
  backend "s3" {
    bucket  = "terraform-state-1q2w3e"
    key     = "terraform/myproject"
    region  = "us-east-1"
    profile = "default"
  }
}
# https://stackoverflow.com/a/57599460