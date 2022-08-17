provider "aws" {
  region = "us-east-1"
#   profile = "edipnegiz"     # fazladan hesap olursa kulllanilir
}

module "docker_instance" {
  source   = "medipnegiz/docker-instance/aws"
  version = "0.0.5"
  key_name = "NVirginia-key"
  docker_instance_ports = [ 22, 80, 443, 8080, 81, 82 ]
  num_of_instance = 2
}

output "pub-ip" {
  value = module.docker_instance.*.instance_public_ip
}