
variable "amiid" {
  type = string
  default = "ami-0b9ecf71fe947bbdd"
  
}

variable "sg_id" {}
variable "ec2_name" {}
  
  
resource "aws_instance" "terraforminstance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name = "Terraform"
  vpc_security_group_ids = ["${var.sg_id}"] 

  
}
  
