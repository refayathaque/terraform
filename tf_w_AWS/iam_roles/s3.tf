resource "aws_s3_bucket" "b" {
  bucket = var.BUCKET_NAME
  acl    = "private"
  force_destroy = true
  tags = {
    Name = var.BUCKET_NAME
  }
}