resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-refayat"
  acl    = "private"

  tags = {
    Name = "Terraform state"
  }
}
