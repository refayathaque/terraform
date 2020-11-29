data "aws_ip_ranges" "west_coast_ec2" {
  regions  = ["us-west-1", "us-west-2"]
  services = ["ec2"]
}

resource "aws_security_group" "from_west_coast" {
  name = "from_west_coast"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = slice(data.aws_ip_ranges.west_coast_ec2.cidr_blocks, 0, 50)
  }
  tags = {
    CreateDate = data.aws_ip_ranges.west_coast_ec2.create_date
    SyncToken  = data.aws_ip_ranges.west_coast_ec2.sync_token
  }
}
