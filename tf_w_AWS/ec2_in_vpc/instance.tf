resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # VPC subnet to launch the instance in
  subnet_id = aws_subnet.main-public-1.id

  # security group to launch the instance in
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # public SSH key
  key_name = aws_key_pair.mykey.key_name
}
