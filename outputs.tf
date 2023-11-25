output "public_ip" {
  description = "public ip of the instance"
  value = try(
    aws_instance.main.public_ip,
    null,
  )
}