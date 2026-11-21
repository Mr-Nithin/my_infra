terraform {
  source = "git::https://github.com/Mr-Nithin/tf_modules.git//pod_identity_agent?ref=Pod_Identity_Agent-v0.1"

}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  cluster_name = dependency.eks.outputs.eks_name
  addon_version = "v1.4.1-eksbuild.3" 
}

dependency "eks" {
  config_path = "../eks"
  mock_outputs = {
    eks_name = "MyKi"
  }
}