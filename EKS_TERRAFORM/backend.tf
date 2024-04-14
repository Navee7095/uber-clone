terraform {
  backend "s3" {
    bucket = "naveen-vcube2" # Replace with your actual S3 bucket name
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}
