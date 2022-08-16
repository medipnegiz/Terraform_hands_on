module "tf-vpc" {
  source = "../modules"
  environment = "UFUK"
  private_subnet_cidr = "10.0.4.0/24"
}

# resource "aws_subnet" "deneme" {
#   vpc_id = module.tf-vpc.vpc_id
#   cidr_block = "10.0.6.0/24"
#   tags = {
#     "Name"  = "${module.tf-vpc.cidr_block}-deneme-amacli"
#   }
# }

output "vpc-cidr" {
  value = module.tf-vpc.vcp-cidr
}

output "vpc-AZ" {
  value = module.tf-vpc.private-AZ
}