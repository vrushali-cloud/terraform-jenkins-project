resource "aws_security_group" "jenkins-demo-sg" {
  name        = "jenkins-sg"
  description = "Allow TLS inbound traffic"

 ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
    #type = "ssh"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    #type = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    #type = "https"
    cidr_blocks = ["0.0.0.0/0"]
  }
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}
resource "aws_instance" "jenkins-ec2-project" {
  ami           = var.ami
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.jenkins-demo-sg.name]
  
  user_data = "${file("init.sh")}"
  tags = {
    Name = "jenkins-project"
  }
}