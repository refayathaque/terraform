resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # VPC subnet to launch the instance in
  # subnet_id = aws_subnet.main-public-1.id

  # security group to launch the instance in
  # vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # since we're not launching this instance in a VPC (which would also launch this instance in a AZ-specific subnet), and since our EBS volume requires us to specify an AZ for it, we need specify an AZ here. AZs for instances are optional, but we need it in this instance because we are attaching an extra volume to it.
  availability_zone = "${var.AWS_REGION}a"

  # public SSH key
  key_name = aws_key_pair.mykey.key_name

  # if you want to increase the storage or type of the root volume
  root_block_device {
    volume_size           = 16
    volume_type           = "gp2"
    delete_on_termination = true
  }
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "${var.AWS_REGION}a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.example.id
}