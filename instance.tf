resource "aws_instance" "Jenkins-Server" {
  instance_type               = "t2.medium"
  key_name                    = "ec2-tutorials"
  ami                         = "ami-04b4f1a9cf54c11d0"
  vpc_security_group_ids      = [aws_security_group.vpc_standard-sg.id]
  associate_public_ip_address = true
  availability_zone           = "us-east-1a"
  subnet_id                   = aws_subnet.standard_subnet_01.id
  #root disk
  root_block_device {
    volume_size           = "50"
    volume_type           = "gp2"
    encrypted             = false
    delete_on_termination = true
  }
  tags = {
    "Name" = "Jenkins-Server"
  }
}
