resource "aws_instance" "web-server" {
  count	        = 1
  ami           = "ami-0a887e401f7654935"
  instance_type = "t2.micro"
  
  key_name = "ExampKP"

  vpc_security_group_ids = ["sg-0d9a3a138f6746c16"]

	user_data = <<EOT
#! /bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo service httpd start
echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
EOT

 tags = {
    owner = "terraform"
  }
}

output "aws_instance_ip" {

  value = "${aws_instance.web-server[0].public_ip}"
  description = "The public IP address of our instance"
}
