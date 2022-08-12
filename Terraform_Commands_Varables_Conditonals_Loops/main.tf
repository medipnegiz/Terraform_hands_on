terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.25.0"
    }
    # github = {
    #     source  = "integrations/github"
    #     version = "~> 4.0"
    # }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  mytag = "edip-local-name"
  myami = "ami-090fa75af13c156b4"
  mytype = "t2.micro"
}

resource "aws_instance" "tf-ec2-ubuntu" {
  # ami             = "ami-090fa75af13c156b4"
  ami             = var.ec2-ami
  instance_type   = var.ec2-type
  key_name        = "DONT FORGET ME"   # .pem olmadan yazilacak
  security_groups = ["ssh-only"]
  tags = {
    Name = "${local.mytag}-come from local" # isim sonuna ekleme yapmak icin kullanilir
    # Name = var.ec2-name         # degisken olarak direk böyle kullanilabilir
  }
  # user_data = file("userdata.sh")     # Userdata disaridan almak icin kullanilir

  # user_data = <<-EOF      # bu sekilde kullanilabilir
  # #!/bin/bash
  # yum update -y
  # EOF
}

resource "aws_s3_bucket" "tf-s3" {
  # bucket = "edip-tf-s3"
  # bucket = "${var.s3-bucket-name}-${count.index}"   # index numarasina göre bucket isimlendirir
  # count = var.num_of_buckets
  # count = var.num_of_buckets != 0 ? var.num_of_buckets : 3  # ? önceki kisim dogri ise yapar, sonraki kisim yanlissa yapar
  for_each = toset(var.users)
  bucket = "edipcan-s3-${each.value}"
  tags = {
    "Name" = local.mytag
  }
}


resource "aws_iam_user" "new_users" {
  for_each = toset(var.users)     # listeyi "toset" ile kümeye dönüstürür ve tek tek deger alir
  name = each.value   # her isime özel profil olusturacak
}