resource "aws_instance" "example" {
  # ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}

output "ip" {
  value = aws_instance.example.public_ip
}
# ^ just logs the output's value after running `terraform apply`