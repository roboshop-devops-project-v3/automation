data "aws_ami" "rhel" {
  most_recent = true
  name_regex  = "RHEL-9-DevOps-Practice"
  owners      = ["973714476881"]
}


resource "aws_instance" "instance" {
  for_each               = local.instances
  ami                    = data.aws_ami.rhel.image_id
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-0a1a60a833ad42c5f"]

  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "record" {
  for_each = local.instances
  name    = "${each.key}-test"
  type    = "A"
  zone_id = "Z007676254S94NU47MG"
  ttl     = 3
  records = [aws_instance.instance[each.key].private_ip]
}

resource "null_resource" "app_instances" {
  for_each = var.app_instances
  provisioner "remote-exec" {

    connection {
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.instance[each.key].public_ip
    }

#     inline = [
#       "rm -rf automation",
#       "git clone https://github.com/roboshop-devops-project-v3/automation.git",
#       "cd automation",
#       "sudo bash ${each.key}.sh"
#     ]

    inline = [
      "sudo dnf install docker -y"
    ]

  }
}

resource "null_resource" "db_instances" {
  for_each = var.db_instances
  provisioner "remote-exec" {

    connection {
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.instance[each.key].public_ip
    }

        inline = [
          "rm -rf automation",
          "git clone https://github.com/roboshop-devops-project-v3/automation.git",
          "cd automation",
          "sudo bash ${each.key}.sh"
        ]

  }
}



provider "aws" {
  region = "us-east-1"
}


variable "app_instances" {
  default = {

    frontend = {}
    catalogue = {}
    user = {}
    cart = {}
    shipping = {}
    payment = {}

  }
}

variable "db_instances" {
  default = {

    mongo = {}
    rabbitmq = {}
    redis = {}
    mysql = {}

  }
}

locals {
  instances = merge(var.app_instances, var.db_instances)
}