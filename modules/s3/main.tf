resource "aws_s3_bucket" "s3" {
  bucket = var.bucket_name
}

# resource "aws_dynamodb_table" "state_locks" {
#   name         = "state_locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }