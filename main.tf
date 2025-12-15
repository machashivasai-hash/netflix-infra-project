provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "one" {
  count                  = 3
  ami                    = "ami-02b8269d5e85954ef"
  instance_type          = "c7i-flex.large"
  key_name               = "AMAZONWEB"
  vpc_security_group_ids = ["sg-0b2aa229ec61b4f56"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "Monitoring server"]
}
