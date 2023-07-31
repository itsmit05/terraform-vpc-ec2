output "public_instance_id_1" {
  value = aws_instance.public_instance[0].id
}

output "public_instance_id_2" {
  value = aws_instance.public_instance[1].id
}

output "private_instance_id" {
  value = aws_instance.private_instance.*.id
}

output "public_instance_ip" {
  value = aws_instance.public_instance.*.public_ip
}

output "private_instance_ip" {
  value = aws_instance.private_instance.*.private_ip
}
