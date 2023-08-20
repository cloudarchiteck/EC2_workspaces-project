
provider "aws" {
    region = "ap-south-1"
    profile = "terraform-advanced" #create your key pair profile to access EC2
  
}
module "sg_module" {
    source = "./sg_module"
    sg_name="sg_ec2_${local.env}"

    
  
}

module "EC2_module" {
    source = "./EC2_module"
    sg_id = "${module.sg_module.sg_id_output}"
    ec2_name = "EC2 instance_${local.env}"
  
}

locals {
  env = "${terraform.workspace}"

  amiid_env = {
    default    = "amiid_default"
    staging    = "amiid_staging"
    production = "amiid_production"
  }

  amiid_default = "${lookup(local.amiid_env, local.env)}"
}


output "envspecificoutput_variable" {
    value = local.amiid_default
  
}