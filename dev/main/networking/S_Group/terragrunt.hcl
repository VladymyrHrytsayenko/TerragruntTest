terraform {
  source = "../../../../modules/main/networking/S_Group/"
}

include "root" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "VPC" {
  config_path                             = "../VPC"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    vpc_id         = "fake-vpc-id"
    vpc_cidr_block = "10.0.0.0/16"
  }
}

inputs = {
  vpc_id     = dependency.VPC.outputs.vpc_id
  alow_ports = ["80", "443", "179"]
}
