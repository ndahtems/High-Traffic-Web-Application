# VPC
resource "aws_vpc" "web_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Public Subnets
resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.web_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "en-north-1a"
}

# Security Group
resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.web_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# Load Balancer
resource "aws_lb" "web_alb" {
  name               = "web-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [aws_subnet.public1.id]
}

# Auto Scaling Group
#resource "aws_autoscaling_group" "web_asg" {
# min_size            = 2
#max_size            = 10
# desired_capacity    = 2
#vpc_zone_identifier = [aws_subnet.public1.id]
#}

# RDS Database
#resource "aws_db_instance" "web_db" {
#allocated_storage   = 20
# engine              = "mysql"
#instance_class      = "db.t3.medium"
#username            = "admin"
#password            = "securepassword"
#skip_final_snapshot = true
#}