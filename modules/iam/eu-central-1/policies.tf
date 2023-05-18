data "aws_iam_policy_document" "table_courses" {
  statement {
    actions = [
      "dynamodb:Scan",
      "dynamodb:PutItem",
      "dynamodb:GetItem",
      "dynamodb:DeleteItem",
      "dynamodb:UpdateItem",
    ]

    resources = [
      var.table_courses_arn
    ]
  }
}


resource "aws_iam_policy" "table_courses" {
  name   = module.label_table_courses.id
  path   = "/"
  policy = data.aws_iam_policy_document.table_courses.json
}