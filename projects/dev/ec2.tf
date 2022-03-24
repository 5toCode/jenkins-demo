resource "aws_instance" "jenkins-server" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name = var.ami_key_pair_name

  vpc_security_group_ids = ["${aws_security_group.jenkins-demo-sg.id}"]

  tags = {
    Name = "jenkins-server"
  }
}

resource "aws_security_group" "jenkins-demo-sg" {

  name        = "jenkins-demo-sg"
  description = "Security group for jenkins demo"
  vpc_id      = "vpc-00e7e47a"

  ingress {
    self      = false
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  ingress {
    self      = false
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  ingress {
    self      = false
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}