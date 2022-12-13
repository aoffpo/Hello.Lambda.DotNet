resource "aws_dynamodb_table" "terraform-state" {
 name           = "terraform-state"
 read_capacity  = 20
 write_capacity = 20
 hash_key       = "LockID"
 tags           = var.resource_tags
 attribute {
   name = "LockID"
   type = "S"
 }
}