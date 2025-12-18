provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-0b46816ffa1234887"
  instance_type          = "c7i-flex.large"
  key_name               = "AMAZONWEB"
  vpc_security_group_ids = ["sg-0fce156bf5c3972dd"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["Ansible", "tomcat-1", "tomcat-2"]
}
