provider "aws" {
  region = var.aws_region
}

# Security Group for the LAMP Server
resource "aws_security_group" "lamp_sg" {
  name        = "lamp-sg"
  description = "Allow HTTP, HTTPS, SSH, and Node Exporter traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # For SSH access - restrict to your IP in production
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9100 # Node Exporter port
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow Prometheus to scrape - can be restricted to Prometheus server's IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "LAMP_SG"
  }
}

# Security Group for the Prometheus Server
resource "aws_security_group" "prometheus_sg" {
  name        = "prometheus-sg"
  description = "Allow HTTP, HTTPS, SSH, and Prometheus access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # For SSH access - restrict to your IP in production
  }

  ingress {
    from_port   = 9090 # Prometheus port
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Prometheus_SG"
  }
}

# EC2 Instance for the LAMP Stack
resource "aws_instance" "lamp_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.lamp_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "LAMP_Server"
  }
}

# EC2 Instance for Prometheus
resource "aws_instance" "prometheus_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.prometheus_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "Prometheus_Server"
  }
}