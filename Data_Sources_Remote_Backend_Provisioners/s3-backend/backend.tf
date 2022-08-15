provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "men-s3" {
  bucket        = "men-s3backend-terraform"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "s3-version" {
  bucket = aws_s3_bucket.men-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3-sifre" {
  bucket = aws_s3_bucket.men-s3.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "tf-s3-app-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}