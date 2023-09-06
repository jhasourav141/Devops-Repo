terraform {
  backend "s3" {
    bucket         = "your-s3-bucket-name"
    key            = "terraform.tfstate"
    region         = var.aws_region
    encrypt        = true
    dynamodb_table = "your-dynamodb-table-name"
  }
}
