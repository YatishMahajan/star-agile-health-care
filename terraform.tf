provider "aws" {
  region  = "us-east-1"
resource "aws_instance" "Prod_Server" {
  ami = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id = "subnet-02be3ea5944095c7d"
  vpc_security_group_ids = ["sg-064f39ee2819605a4"]
  key_name = "security key2"
  tags = {
    Name = "Prod_Server"
  }
} }
