resource "aws_security_group" "vpc_standard-sg" {
  vpc_id      = aws_vpc.vpc_standard.id
  name        = "vpc_standard-sg"
  description = "Allow SSH inbound and all outbound traffic"
  tags = {
    "Name" = "vpc_standard-sg"
  }

  # SSH access - restrict to your IP in production (replace 0.0.0.0/0 with your CIDR)
  ingress {
    description = "SSH from allowed CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
