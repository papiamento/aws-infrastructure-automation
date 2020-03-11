resource "aws_s3_bucket" "f1kart-ccp" {
  count = 0

  bucket = "ccp.f1kart.com"

  acl    = "private"

  tags = {
    Owner        = "Terraform"
  }
}
