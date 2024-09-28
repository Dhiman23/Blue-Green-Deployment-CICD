terraform {
  backend "s3" {
    bucket = "terra-bucket-12"
    key    = "blue-greeng/terraform.tfstate"
    region = "us-east-1"
  }
}