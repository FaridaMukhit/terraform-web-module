output "vpc_id" {
  description = "The ID of the custom VPC"
  value       = aws_vpc.custom_vpc.id
}

output "public_subnet1_id" {
  description = "The IDs of the public subnets in the custom VPC"
  value       = aws_subnet.public_subnet1.id
}
 
output "public_subnet2_id" {
  description = "The IDs of the public subnets in the custom VPC"
  value       = aws_subnet.public_subnet2.id
}
 
output "public_subnet3_id" {
  description = "The IDs of the public subnets in the custom VPC"
  value       = aws_subnet.public_subnet3.id
}

output "private_subnet1_id" {
  description = "The IDs of the private subnets in the custom VPC"
  value       = aws_subnet.private_subnet1.id
}

output "private_subnet2_id" {
  description = "The IDs of the private subnets in the custom VPC"
  value       = aws_subnet.private_subnet2.id
}

output "private_subnet3_id" {
  description = "The IDs of the private subnets in the custom VPC"
  value       = aws_subnet.private_subnet3.id
}