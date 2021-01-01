terraform {
 backend "s3" {
   bucket = "terraform-state-h1czz6w3"
   key    = "terraform.tfstate"
   region = "eu-west-1"
 }
}