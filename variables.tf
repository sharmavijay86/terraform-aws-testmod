variable "inbound_rules" {
  default = [{ port = 22, protocol = "tcp" }, { port = 80, protocol = "tcp" }, { port = 443, protocol = "tcp" }, { port = 53, protocol = "tcp" }]
}
variable "sg_name" {
  default = "myacl"
}
variable "sg_from_cidr" {
  default = ["0.0.0.0/0"]
}
variable "data_ami_filter_name" {
  default = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
}
variable "data_ami_owner_ids" {
  default = ["099720109477"]
}
variable "key_name" {
  default = "cloudkey"
}
variable "key_pub_file_name" {
  default = "aws-key.pub"
}
variable "ami_id" {
  type    = string
  default = null
}
variable "instance_type" {
  default = "t2.micro"
}
variable "user_data" {
  default = null
}
variable "availability_zone" {
  default = null
}
variable "subnet_id" {
  default = null
}
variable "instance_tags" {
  description = "Additional tags for the instance"
  type        = map(string)
  default     = {}
}
variable "vpc_id" {
  default = null
}
