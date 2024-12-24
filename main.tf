terraform { 
  cloud { 
    
    organization = "mahatest" 

    workspaces { 
      name = "dev-env" 
    } 
  } 
}
provider "aws" {
  region = var.aws_region
}
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "TerraformCloudExample"
  }
}

variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-01816d07b1128cd2d" # Example: Amazon Linux 2 AMI
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

output "instance_public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.example.public_ip
}

