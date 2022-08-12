variable "s3-bucket-name" {
  default = "men-tf-bucket"
}

variable "ec2-name" {
  default = "MEN-ec2"
  # type = string
  # description = "isim degiskenidir"
}

variable "ec2-type" {
  default = "t2.micro"
}

variable "ec2-ami" {
  default = "ami-090fa75af13c156b4"
}

variable "num_of_buckets" {
  default = 2
}

variable "users" {
  default = ["santino", "michael", "fredo"]
}