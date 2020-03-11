resource "aws_s3_bucket" "f1kart-ccp" {
  bucket = "ccp.f1kart.com"

  acl    = "private"

  tags = {
    Owner        = "Terraform"
  }
}
