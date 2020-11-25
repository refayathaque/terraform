provider "aws" {
  region     = var.AWS_REGION
  profile = "default"
}

resource "aws_instance" "example" {
  ami           = "ami-0dbb9a01ce177be97"
  instance_type = "t2.micro"
}
