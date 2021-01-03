# terraform-aws-artifactory-ecs

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-artifactory-ecs/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-artifactory-ecs)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-artifactory-ecs.svg)](https://github.com/JamesWoolfenden/terraform-aws-artifactory-ecs/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

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

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_cidr | The allowed IP ranges | `list(any)` | n/a | yes |
| cluster\_arn | The ARN of the existing ECS Cluster | `string` | n/a | yes |
| common\_tags | n/a | `map(any)` | `{}` | no |
| db\_allocated\_storage | The size of the database (Gb) | `string` | `"5"` | no |
| db\_instance\_class | The database instance type | `string` | `"db.t2.small"` | no |
| db\_name | MySQL database name | `string` | `"artdb"` | no |
| db\_password | Database password | `string` | `"password"` | no |
| db\_user | Database user name | `string` | `"artifactory"` | no |
| instance\_SG | n/a | `string` | n/a | yes |
| instances | n/a | `list(any)` | n/a | yes |
| kms\_key\_id | n/a | `string` | n/a | yes |
| master\_key | n/a | `string` | n/a | yes |
| outbound | n/a | `list(any)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| record | n/a | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| retention\_in\_days | n/a | `string` | `180` | no |
| ssl\_certificate\_id | n/a | `string` | n/a | yes |
| subnet\_ids | n/a | `list(any)` | n/a | yes |
| targetgroup\_http\_name | n/a | `string` | `"artifactoryhttp"` | no |
| targetgroup\_ssl\_name | n/a | `string` | `"artifactoryssl"` | no |
| vpc\_id | The VPC id | `string` | n/a | yes |
| zone\_id | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cluster | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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

Copyright © 2019-2021 James Woolfenden

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
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-artifactory&url=https://github.com/JamesWoolfenden/terraform-aws-artifactory
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-artifactory&url=https://github.com/JamesWoolfenden/terraform-aws-artifactory
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-artifactory
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-artifactory
[share_email]: mailto:?subject=terraform-aws-artifactory&body=https://github.com/JamesWoolfenden/terraform-aws-artifactory
