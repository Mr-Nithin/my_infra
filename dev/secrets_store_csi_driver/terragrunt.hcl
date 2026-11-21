terraform {
  source = "git::https://github.com/Mr-Nithin/tf_modules.git//secrets_store_csi_driver?ref=aws_secrets_store_csi_driver-v0.1"

}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  cluster_name = dependency.eks.outputs.eks_name
  addon_version = "v3.2.0-eksbuild.1" 
}

dependency "eks" {
  config_path = "../eks"
  mock_outputs = {
    eks_name = "MyKi"
  }
}