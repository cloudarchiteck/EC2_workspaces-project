variable "vpc" {
  type = string
  default = "vpc-053c0f669798193d9"#Use your default VPC id
  
}

variable "sg_name" {
  
}
resource "aws_security_group" "terraform_ec2_sg" {
  name        = "${var.sg_name}"
  description = "terraform concepts"
  vpc_id      = "${var.vpc}"

  ingress {
    description      = "terraform concepts"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}

output "sg_id_output" {
    value = "${aws_security_group.terraform_ec2_sg.id}"
  
}
