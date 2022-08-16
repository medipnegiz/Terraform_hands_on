output "vpc_id" {
  value = aws_vpc.module-vpc.id
}

output "vcp-cidr" {
  value = aws_vpc.module-vpc.cidr_block
}

output "public-subnet-cidr" {
  value = aws_subnet.public-subnet.cidr_block
}

output "private-subnet-cidr" {
  value = aws_subnet.private-subnet.cidr_block
}

output "public-AZ" {
  value = aws_subnet.public-subnet.availability_zone
}

output "private-AZ" {
  value = aws_subnet.private-subnet.availability_zone
}