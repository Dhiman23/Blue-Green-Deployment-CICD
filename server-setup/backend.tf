terraform {
  backend "s3" {
    bucket = "terra-bucket-12"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}