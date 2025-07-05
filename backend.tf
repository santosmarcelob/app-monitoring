terraform {
  backend "s3" {
    bucket = "meu-wallace-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}