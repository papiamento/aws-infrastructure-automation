resource "aws_s3_bucket" "coronavirus-cancellations" {
  count = 1

  bucket = "coronavirus-cancellations.com"

  acl    = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Owner        = "Terraform"
  }
}
