# AutoSG

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.ClusterASG](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_launch_template.main_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_ami.linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_SGroup_id"></a> [SGroup\_id](#input\_SGroup\_id) | n/a | `string` | `"aws_security_group.MainSG.id"` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | n/a | `string` | `"3"` | no |
| <a name="input_instance"></a> [instance](#input\_instance) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_max"></a> [max](#input\_max) | n/a | `string` | `"4"` | no |
| <a name="input_min"></a> [min](#input\_min) | n/a | `string` | `"3"` | no |
| <a name="input_owners"></a> [owners](#input\_owners) | n/a | `string` | `"137112412989"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | <pre>{<br>  "Name": "ClusterServer",<br>  "Owner": "MyServer",<br>  "TAGKEY": "TAGVALUE"<br>}</pre> | no |
| <a name="input_values"></a> [values](#input\_values) | n/a | `string` | `"al2023-ami-*-kernel-6.1-x86_64"` | no |
| <a name="input_vpc_zone_identifier"></a> [vpc\_zone\_identifier](#input\_vpc\_zone\_identifier) | n/a | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_AG_arn"></a> [AG\_arn](#output\_AG\_arn) | n/a |
| <a name="output_AutoSG_id"></a> [AutoSG\_id](#output\_AutoSG\_id) | n/a |
| <a name="output_LT_ServerName"></a> [LT\_ServerName](#output\_LT\_ServerName) | n/a |
| <a name="output_main_server_templeteid"></a> [main\_server\_templeteid](#output\_main\_server\_templeteid) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
