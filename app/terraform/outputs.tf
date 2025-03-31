output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.bulletin-vpc.id
}

output "public_subnet_ids" {
  description = "List of IDs of the created public subnets"
  value       = aws_subnet.bulletin-sb[*].id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.bulletin-server.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.bulletin-server.id
}