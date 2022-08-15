terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
  }
  backend "s3" {
    bucket         = "men-s3backend-terraform"
    key            = "env/dev/tf-remote-backend.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-s3-app-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "tf-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["my-ami-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["self"] # kendisi oldugunu belirtmek icin 
}

resource "aws_instance" "tf-ec2" {
  ami           = data.aws_ami.tf-ami.id
  instance_type = var.ec2-type
  key_name      = "DONT FORGET ME" # Key yazilacak
  tags = {
    Name = "${local.my-tag}-from my-ami"
  }
}
