terraform {
  source = "git::https://github.com/Mr-Nithin/tf_modules.git//master_eks?ref=master_eks-v0.2"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  cluster_name = "MyEKS"
  eks_version = "1.35"
  deletion_protection = false
  subnet_ids =  dependency.vpc.outputs.Private_Subnet_ids
  enable_irsa = true
  node_groups = {
    general = {
      capacity_type = "SPOT"
      instance_types = ["c7i-flex.large"]
      scaling_config = {
        desired_size = 1
        min_size = 1 
        max_size = 10 
      }
      update_config = {
        max_unavailable = 1
      }
    }
  }

}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs = {
    Private_Subnet_ids = ["subnet-1234", "subnet-5678"]
  }
}