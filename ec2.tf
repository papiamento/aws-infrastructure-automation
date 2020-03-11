provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "cloud-practitioner-ec2lab" {
  count	        = 1
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  
  key_name = "My Private Key"
  # vpc_security_group_ids = ["sg-0077..."]
  # subnet_id = "subnet-923a..."

  tags = {
    owner = "terraform"
  }

  vpc_security_group_ids = ["sg-0d9a3a138f6746c16"]
}
