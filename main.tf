resource "aws_key_pair" "main" {
  key_name   = var.key_name
  public_key = file(var.key_pub_file_name)
}
resource "aws_instance" "main" {
  ami               = try(data.aws_ami.main.id, var.ami_id)
  instance_type     = var.instance_type
  security_groups   = [aws_security_group.main.name]
  key_name          = aws_key_pair.main.key_name
  user_data         = var.user_data
  availability_zone = var.availability_zone
  subnet_id         = var.subnet_id
  tags              = var.instance_tags
}

resource "aws_security_group" "main" {
  name   = var.sg_name
  vpc_id = try(data.aws_vpc.main.id, var.vpc_id)
  dynamic "ingress" {
    for_each = var.inbound_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = var.sg_from_cidr
    }
  }
}