terraform {
  source = "git::https://github.com/Mr-Nithin/tf_modules.git//master_network?ref=master_network-v0.1"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  cidr_block =  "10.0.0.0/16"
  vpc_name  = "MyVPC"
  az = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  flow_logs_retention_days = 60
  serivces = ["s3"]
}



