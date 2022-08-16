terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "module-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    "Name" = "${var.environment}-tf-vpc"
  }
}

resource "aws_subnet" "private-subnet" {
  cidr_block = var.private_subnet_cidr
  vpc_id     = aws_vpc.module-vpc.id
  tags = {
    "Name" = "${var.environment}-tf-privat-subnet"
  }
}

resource "aws_subnet" "public-subnet" {
  cidr_block = var.public_subnet_cidr
  vpc_id     = aws_vpc.module-vpc.id
  tags = {
    "Name" = "${var.environment}-tf-public-subnet"
  }
}

