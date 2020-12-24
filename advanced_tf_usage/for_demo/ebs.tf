resource "aws_ebs_volume" "example" {
  availability_zone = "${var.AWS_REGION}a"
  size              = 8

  tags = {for k, v in merge({ Name = "Myvolume" }, var.project_tags): k => lower(v)}
}