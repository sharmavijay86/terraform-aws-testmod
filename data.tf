data "aws_ami" "main" {
  most_recent = true
  filter {
    name   = "name"
    values = var.data_ami_filter_name
  }
  owners = var.data_ami_owner_ids
}
data "aws_vpc" "main" {
  default = true
}