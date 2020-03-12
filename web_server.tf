resource "aws_instance" "webserver1" {
#  count	        = 1
  ami           = "ami-0a887e401f7654935"
  instance_type = "t2.micro"
  
  key_name = "ExampKP"

  availability_zone = "us-east-1c"

  vpc_security_group_ids = ["sg-0d9a3a138f6746c16"]

    user_data = "${file("web_server1_install.sh")}"

    tags = {
        Name = "webserver1",
        owner = "terraform"
    }
}

resource "aws_instance" "webserver2" {
#  count	        = 1
  ami           = "ami-0a887e401f7654935"
  instance_type = "t2.micro"
  
  key_name = "ExampKP"

  availability_zone = "us-east-1b"

  vpc_security_group_ids = ["sg-0d9a3a138f6746c16"]

    user_data = "${file("web_server2_install.sh")}"

    tags = {
       Name = "webserver2",
       owner = "terraform"
    }
}

output "webserver1" {

  value = "webserver 1: ${aws_instance.webserver1.public_ip}"
  description = "The public IP address of our instance"
}

output "webserver2" {

  value = "webserver 2: ${aws_instance.webserver2.public_ip}"
  description = "The public IP address of our instance"
}