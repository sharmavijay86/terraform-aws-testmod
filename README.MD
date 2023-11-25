# module to create aws_instance resource

### Available variables
inbound_rules 
sg_name 
sg_from_cidr 
data_ami_filter_name 
data_ami_owner_ids 
key_name  
key_pub_file_name
ami_id   
instance_type   
user_data   
availability_zone   
subnet_id  
instance_tags 
vpc_id 


### Example
```hcl
module "mymod" {
  count             = 3
  source            = "./mymod"
  inbound_rules     = [{ port = 22, protocol = "tcp" }, { port = 80, protocol = "tcp" }, { port = 443, protocol = "tcp" }, { port = 53, protocol = "tcp" }]
  sg_name           = "krlabsg-${count.index}"
  sg_from_cidr      = ["0.0.0.0/0"]
  ami_id            = "ami-028b4652a67b2f060"
  key_name          = "cloudkey${count.index}"
  key_pub_file_name = "aws-key.pub"
  availability_zone = "us-west-2b"
  instance_type     = "t2.micro"
  instance_tags     = { Name = "myvm${count.index}" }
}

output "ec2_public_id" {
  description = "The IP of the instance"
  value       = module.mymod[*].public_ip
}
```