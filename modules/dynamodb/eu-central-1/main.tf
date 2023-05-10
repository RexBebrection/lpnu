module "label" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  name       = var.name
  context = var.context
}

resource "aws_dynamodb_table" "this" {
  name             = module.label.id
  hash_key         = "TestTableHashKey"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "TestTableHashKey"
    type = "S"
  }
}