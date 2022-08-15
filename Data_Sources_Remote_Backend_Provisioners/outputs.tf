output "public-ip" {
  value = aws_instance.tf-ec2.public_ip
}

output "ami-id" {
  value = data.aws_ami.tf-ami.id
}

output "instance-arn" {
  value = aws_instance.tf-ec2.arn
}

output "private-ip" {
  value = aws_instance.tf-ec2.private_ip
}