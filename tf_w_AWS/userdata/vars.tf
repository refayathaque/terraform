variable "AWS_REGION" {
  type    = string
  default = "us-east-1"
}

# variable "AWS_PROFILE" {
#   type    = string
#   default = "default"
# }

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-08306577a6694f5e7"
    us-west-1 = "ami-04d12df4da18327bd"
    eu-west-1 = "ami-048309a44dad514df"
  }
}
# http://cloud-images.ubuntu.com/locator/ec2/

variable "INSTANCE_DEVICE_NAME" {
  type    = string
  default = "/dev/xvdh"
}

variable "PATH_TO_PUBLIC_KEY" {
  type    = string
  default = "mykey.pub"
}

# variable "PATH_TO_PRIVATE_KEY" {
#   type    = string
#   default = "mykey"
# }