terraform {
  required_providers {    
    aws = {      
      source  = "hashicorp/aws"      
      version =  "4.25.0" 
      }
    github = {
        source  = "integrations/github"
        version = "~> 4.0"
    }
    }
  }

provider "github" {
  token = "DONT FORGET ME"    # file("ediptoken") olarak yazilabilir
}

resource "github_repository" "tf-github" {
  name = "edipterraform"
  description = "created for testing"
  visibility = "private"
}

provider "aws" {  
  region = "us-east-1"
}

resource "aws_instance" "tf-ec2" {
  ami = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"
  key_name = "DONT FORGET ME"   # .pem olmadan yazilacak
  security_groups = [ "ssh-only" ]
  count = 1
  tags = {
    Name = "created by TF"
  }
  user_data = file("userdata.sh")   # Userdata disaridan almak icin kullanilir
}

resource "aws_s3_bucket" "tf-s3" {
  bucket = "edip-tf-s3"
}