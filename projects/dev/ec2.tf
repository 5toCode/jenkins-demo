resource "aws_instance" "jenkins-server" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  key_name      = "jenkins-kp"

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
}