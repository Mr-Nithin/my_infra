terraform {
  source = "git::https://github.com/Mr-Nithin/tf_modules.git//ebs_csi_driver?ref=ebs_csi_driver-v0.1"

}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  cluster_name = dependency.eks.outputs.eks_name
  addon_version = "v1.68.1-eksbuild.1" 
}

dependency "eks" {
  config_path = "../eks"
  mock_outputs = {
    eks_name = "MyKi"
  }
}