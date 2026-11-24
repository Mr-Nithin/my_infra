terraform {
  source = "git::https://github.com/Mr-Nithin/tf_modules.git//aws_lb_controller?ref=aws_load_balancer_controller-v0.3"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

inputs = {
  cluster_name  = dependency.eks.outputs.eks_name
  chart_version = "3.6.3"
  vpc_id        = dependency.vpc.outputs.vpc_id
  region        = include.root.locals.region
}

dependency "eks" {
  config_path  = "../eks"
  mock_outputs = { eks_name = "MyKi" }
}

dependency "vpc" {
  config_path  = "../vpc"
  mock_outputs = { vpc_id = "vpc-12345678" }
}