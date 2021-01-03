output "elb" {
  value = aws_elb.myapp-elb.dns_name
}

output "instance" {
  value = aws_instance.example.public_ip
}