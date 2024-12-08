# provider.tf
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test_instance" {
  count         = 2 #(2 workers)
  ami           = "ami-0e2c8caa4b6378d8c"  # Example AMI, replace with an appropriate AMI for your region
  instance_type = "t2.micro"

  key_name = "security key2"  # Your existing EC2 key pair name for SSH access

  tags = {
    Name = "test-cluster-instance-${count.index}"
  }

  security_groups = ["sg-064f39ee2819605a4"]  # Attach default security group
}

output "instance_public_ips" {
  value = aws_instance.test_instance[*].public_ip
}
