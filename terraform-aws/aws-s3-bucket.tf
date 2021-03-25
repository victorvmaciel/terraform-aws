resource "aws_s3_bucket" "dev4" {
  bucket = "viktorlabs-dev4"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "viktorlabs-dev4"
  }
}
