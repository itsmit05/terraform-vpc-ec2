output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "public_subnets_id_1" {
  value = "${element(aws_subnet.public_subnet.*.id,1)}"
}

output "public_subnets_id_2" {
  value = "${element(aws_subnet.public_subnet.*.id,2)}"
}

output "private_subnets_id_1" {
  value = "${element(aws_subnet.private_subnet.*.id,1)}"
}

output "private_subnets_id_2" {
  value = "${element(aws_subnet.private_subnet.*.id,2)}"
}

# output "private_subnets_id" {
#   value = aws_subnet.private_subnet.*.id
# }

output "default_sg_id" {
  value = "${aws_security_group.default.id}"
}