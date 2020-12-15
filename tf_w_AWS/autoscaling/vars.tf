variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-08306577a6694f5e7"
    us-west-1 = "ami-04d12df4da18327bd"
    eu-west-1 = "ami-048309a44dad514df"
  }
}
# http://cloud-images.ubuntu.com/locator/ec2/