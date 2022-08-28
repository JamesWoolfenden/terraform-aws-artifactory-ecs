# terraform-aws-artifactory-ecs

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-artifactory-ecs/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-artifactory-ecs)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-artifactory-ecs.svg)](https://github.com/JamesWoolfenden/terraform-aws-artifactory-ecs/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-artifactory.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-artifactory/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-artifactory/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-artifactory&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-artifactory/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-artifactory&benchmark=INFRASTRUCTURE+SECURITY)

One of three Artifactory modules, this one supports deploying Artifactory pro into an Existing ECS cluster.

<https://github.com/jfrog/JFrog-Cloud-Installers/tree/aws-jcr-7.5.5/JFrogContainerRegistry/aws/container>
<https://aws-quickstart.s3.amazonaws.com/quickstart-jfrog-artifactory/templates/jfrog-artifactory-ecs-existing-vpc.template.yaml>

## TODO

The template works as is, but if you use it in production you will need to (apart from getting a licence for JFrog...):

- update the configuration of the container to support RDS and S3/EFS. I have included the disabled Terraform (.txt extension) to support this.
- add the licence at launch time

## masterkey

You need to specify your own master key for your container:

```shell
# Create a key
export MASTER_KEY=$(openssl rand -hex 32)
echo ${MASTER_KEY}
```

Important **Ensure Cluster instance role give cloudwatch logs access**

## Usage

Follow examplea as your guide or add _module.artifactory.tf_ to your own Terraform code:

```terraform
module "artifactory" {
  source             = "JamesWoolfenden/artifactory-ecs/aws"
  version            = "0.0.2"
  common_tags        = var.common_tags
  subnet_ids         = var.subnet_ids
  vpc_id             = var.vpc_id
  cluster_arn        = data.aws_ecs_cluster.ecs-artifactory.arn
  ssl_certificate_id = var.ssl_certificate_id
  allowed_cidr       = var.allowed_cidr
  master_key         = var.master_key
  region             = var.region
  instances          = var.instances
  instance_SG        = var.instance_SG
  record             = var.record
  zone_id            = var.zone_id
}
```

The Latest version supports Terraform v0.14.

## Costs

```text
Monthly cost estimate

Project: .

 Name                                                     Monthly Qty  Unit         Monthly Cost

 module.artifactory.aws_cloudwatch_log_group.artifactory
 ├─ Data ingested                                         Cost depends on usage: $0.60 per GB
 ├─ Archival Storage                                      Cost depends on usage: $0.03 per GB
 └─ Insights queries data scanned                         Cost depends on usage: $0.0059 per GB

 module.artifactory.aws_elb.artifactory
 ├─ Classic load balancer                                         730  hours              $21.46
 └─ Data processed                                        Cost depends on usage: $0.0084 per GB

 PROJECT TOTAL                                                                            $21.46
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.artifactory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_service.artifactory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.artifactory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_elb.artifactory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elb) | resource |
| [aws_iam_role.ecs_artifactory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ecs_artifactory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.artifactory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_route53_record.www](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.elb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.fromelb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_iam_role.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_cidr"></a> [allowed\_cidr](#input\_allowed\_cidr) | The allowed IP ranges | `list(any)` | n/a | yes |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | The existing ECS Cluster | `any` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_db_allocated_storage"></a> [db\_allocated\_storage](#input\_db\_allocated\_storage) | The size of the database (Gb) | `string` | `"5"` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | The database instance type | `string` | `"db.t2.small"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | MySQL database name | `string` | `"artdb"` | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Database password | `string` | n/a | yes |
| <a name="input_db_user"></a> [db\_user](#input\_db\_user) | Database user name | `string` | `"artifactory"` | no |
| <a name="input_instance_SG"></a> [instance\_SG](#input\_instance\_SG) | n/a | `string` | n/a | yes |
| <a name="input_instances"></a> [instances](#input\_instances) | n/a | `list(any)` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | n/a | `string` | n/a | yes |
| <a name="input_master_key"></a> [master\_key](#input\_master\_key) | n/a | `string` | n/a | yes |
| <a name="input_outbound"></a> [outbound](#input\_outbound) | n/a | `list(any)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_record"></a> [record](#input\_record) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | n/a | `string` | `180` | no |
| <a name="input_ssl_certificate_id"></a> [ssl\_certificate\_id](#input\_ssl\_certificate\_id) | n/a | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(any)` | n/a | yes |
| <a name="input_targetgroup_http_name"></a> [targetgroup\_http\_name](#input\_targetgroup\_http\_name) | n/a | `string` | `"artifactoryhttp"` | no |
| <a name="input_targetgroup_ssl_name"></a> [targetgroup\_ssl\_name](#input\_targetgroup\_ssl\_name) | n/a | `string` | `"artifactoryssl"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC id | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-s3](https://github.com/jameswoolfenden/terraform-aws-s3) - S3 buckets

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-artifactory/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-artifactory/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
