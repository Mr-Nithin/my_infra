terraform {
  source = "git::https://github.com/Mr-Nithin/tf_modules.git//subnet_groups?ref=subnet_groups-v0.3"

}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  name = "my-db-subnet-group"
  subnet_ids = dependency.vpc.outputs.Private_Subnet_ids
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    Private_Subnet_ids = ["subnet-1234", "subnet-5678"]
  }
}