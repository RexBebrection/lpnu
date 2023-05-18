module "label_table_courses" {
  source   = "cloudposse/label/null"
  version  = "0.25.0"
  name       = "${var.name}-table-courses"
  context  = var.context
}