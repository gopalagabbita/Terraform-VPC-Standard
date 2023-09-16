resource "aws_instance" "Standard-Server" {
  instance_type               = "t2.medium"
  key_name                    = "ec2-tutorials"
  ami                         = "ami-0261755bbcb8c4a84"
  vpc_security_group_ids      = [aws_security_group.vpc_standard-sg.id]
  associate_public_ip_address = true
  availability_zone           = "us-east-1a"
  subnet_id                   = aws_subnet.standard_subnet_01.id
  #root disk
  root_block_device {
    volume_size = "20"
    volume_type = "gp2"
    encrypted = false 
    delete_on_termination = true
  }
  tags = {
    "Name" = "Standard-Server"
  }
}

resource "aws_instance" "Standard-Server" {
  instance_type               = "t2.medium"
  key_name                    = "ec2-tutorials"
  ami                         = "ami-0261755bbcb8c4a84"
  vpc_security_group_ids      = [aws_security_group.vpc_standard-sg.id]
  associate_public_ip_address = true
  availability_zone           = "us-east-1a"
  subnet_id                   = aws_subnet.standard_subnet_01.id
  #root disk
  root_block_device {
    volume_size = "20"
    volume_type = "gp2"
    encrypted = false 
    delete_on_termination = true
  }
  tags = {
    "Name" = "Standard-Server"
  }
}
