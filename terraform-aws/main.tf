provider "aws"{
    region = "sa-east-1"  
}

provider "aws"{
    alias = "us-east-2"
    region = "us-east-2"
}

# South east 1 instances
# Sao Paulo / Brazil
resource "aws_instance" "dev" {
    count = 3
    ami = var.amis["sa-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name_sa
    tags = {
    Name = "dev${count.index}"
 }
   vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}

resource "aws_instance" "dev4" {
    ami = var.amis["sa-east-1"]
    instance_type = "t2.micro"
    key_name = var.key_name_sa
    tags = {
    Name = "dev4"
 }
   vpc_security_group_ids = [aws_security_group.allow_ssh.id]
   depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
    provider = aws.us-east-2
    ami = var.amis["us-east-2"]
    instance_type = "t2.micro"
    key_name = var.key_name_us
    tags = {
    Name = "dev5"
 }
   vpc_security_group_ids = [aws_security_group.allow_ssh-us-east-2.id]
}

# Different region ec2
# Watch out the ami id
# also differente security group
resource "aws_instance" "dev6" {
    provider = aws.us-east-2
    ami = var.amis["us-east-2"]
    instance_type = "t2.micro"
    key_name = var.key_name_us
    tags = {
    Name = "dev6"

 }
    vpc_security_group_ids = [aws_security_group.allow_ssh-us-east-2.id]
    depends_on = [
    aws_dynamodb_table.dynamodb-stage   ]
}

resource "aws_dynamodb_table" "dynamodb-stage" {
    provider = aws.us-east-2
    name           = "GameScores"
    billing_mode   = "PROVISIONED"
    read_capacity  = 20
    write_capacity = 20
    hash_key       = "UserId"
    range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}