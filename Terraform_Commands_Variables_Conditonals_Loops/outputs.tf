output "ip" {
  value = aws_instance.tf-ec2-ubuntu.public_ip
}

output "ip-private" {
  value = aws_instance.tf-ec2-ubuntu.private_ip
}

# output "s3-bucket" {
#   value = aws_s3_bucket.tf-s3.*.bucket    # count ile kullanimda böyle kullanilir
#   # value = aws_s3_bucket.tf-s3.bucket
# }

output "uppercase_users" {
  value = [for i in var.users : upper(i) if length(i) > 6]
}