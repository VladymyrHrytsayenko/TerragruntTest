terraform {
  source = "../../../modules/main/AutoSG/"
}


include "root" {
  path   = find_in_parent_folders()
  expose = true
}

dependency "VPC" {
  config_path                             = "../networking/VPC/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    vpc_id         = "fake-vpc-id"
    vpc_cidr_block = "10.0.0.0/16"
    Public_ids     = ["10.0.10.0/24", "10.0.16.0/24"]
  }
}

dependency "sg" {
  config_path                             = "../networking/S_Group/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "providers", "terragrunt-info", "show"]
  mock_outputs = {
    Securitygroup_id = "fake-sg-ids"
  }
}

inputs = {
  vpc_zone_identifier = dependency.VPC.outputs.Public_ids
  SGroup_id           = dependency.sg.outputs.Securitygroup_id
  owners              = "137112412989"
  values              = "al2023-ami-*-kernel-6.1-x86_64"
  instance            = "t2.micro"
  min                 = "3"
  max                 = "4"
}
