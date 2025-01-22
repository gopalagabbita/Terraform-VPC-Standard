resource "aws_vpc" "vpc_standard" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  tags = {
    "Name" = "vpc_standard"
  }
}
resource "aws_internet_gateway" "standard01" {
  vpc_id = aws_vpc.vpc_standard.id
  tags = {
    "Name" = "vpc_standard_standard1"
  }
}
