

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound "

  ingress {

    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_remote_acess
  }


  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "allow_ssh-us-east-2" {
  provider = aws.us-east-2
  name        = "allow_ssh-us-east-2"
  description = "Allow SSH inbound to us-east-2 instances "

  ingress {

    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cdirs_remote_acess
  }


  tags = {
    Name = "ssh-us-east-2"
  }
}