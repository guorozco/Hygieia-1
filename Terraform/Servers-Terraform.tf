provider "aws" {
  access_key = "AKIAIFG4DXQRB3K4LU5Q"
  secret_key = "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"
  region     = "us-east-2"
}

resource "aws_security_group" "ssh_and_http" {
  name = "allow_ssh_and_http"
  description = "Allow SSH and HTTP traffic"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 443
      to_port = 443
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins_master_Gorilla" {
  ami           = "ami-0bc22eb44229dba85"
  instance_type = "t2.medium"
  security_groups = ["${aws_security_group.ssh_and_http.name}"]
  key_name = "AWS_Gorilla_Demo"
  tags {
        Name = "jenkins_master_Gorilla"
        role = "jenkins_master_Gorilla"
       }

}

resource "aws_instance" "swarm-docker_Gorilla" {
  ami           = "ami-05fc82bf866f14cd9"
  instance_type = "t2.medium"
  security_groups = ["${aws_security_group.ssh_and_http.name}"]
  key_name = "AWS_Gorilla_Demo"
  tags {
        Name = "swarm-docker_Gorilla"
        role = "swarm-docker_Gorilla"
       }

}

resource "aws_eip" "jenkins_master_Gorilla" {
	instance = "${aws_instance.jenkins_master_Gorilla.id}"    
	vpc = true
}
