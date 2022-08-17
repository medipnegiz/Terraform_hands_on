provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "tfmyec2" {
  ami           = lookup(var.my-ami, terraform.workspace)                  # hangi workspace de calistigini algilar ve ona göre "ami" getirir
  instance_type = terraform.workspace == "dev" ? "t3a.medium" : "t2.micro" # dogru ise "t3a.medium", yanlissa "t2.micro"
#   instance_type = lookup(var.men-instance-type, terraform.workspace)
  count         = terraform.workspace == "prod" ? 3 : 1
#   count = lookup(var.men-count, terraform.workspace)
security_groups = [ "${terraform.workspace == "edip" ? "ssh-http" : "ssh-only"}" ]
  key_name      = "NVirginia-key"
  tags = {
    "Name" = "${terraform.workspace}-server"
  }
}

variable "my-ami" {
  type = map(string)
  default = {
    default = "ami-090fa75af13c156b4"
    dev     = "ami-06640050dc3f556bb"
    prod    = "ami-052efd3df9dad4825"
  }
  description = "in order of aAmazon Linux 2 ami, Red Hat Enterprise Linux 8 ami and Ubuntu Server 20.04 LTS amis"

# variable "men-instance-type" {
#   type = map(string)
#   default = {
#     default = "t2.micro"
#     edip    = "t3.micro"
#     ufuk    = "t3a.medium"
#   }
# }

# variable "men-count" {
#   type = map(string)
#   default = {
#     default = 1
#     edip    = 2
#     ufuk    = 3
#   }
# }
}