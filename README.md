# terraform-aws-artifactory-ecs

How
<https://github.com/jfrog/JFrog-Cloud-Installers/tree/aws-jcr-7.5.5/JFrogContainerRegistry/aws/container>

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | 3.14.1 |
| template | 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | 3.14.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_cidr | n/a | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| artifactory\_server\_name | Provide artifactory server name to be used in Nginx. e.g artifactory for artifactory.jfrog.team | `string` | `"artifactory"` | no |
| artifactory\_sg\_name | (optional) describe your variable | `string` | `"artifactory_sg"` | no |
| availability\_zone | n/a | `any` | n/a | yes |
| aws\_region | AWS region to launch servers. | `string` | `"us-west-1"` | no |
| bucket\_name | AWS S3 Bucket name | `string` | `"artifactory-enterprise-bucket"` | no |
| certificate\_domain | Provide your Certificate Domain Name. For e.g jfrog.team for certificate with \*.jfrog.team | `string` | `"artifactory"` | no |
| common\_tags | n/a | `map` | <pre>{<br>  "createdby": "Terraform"<br>}</pre> | no |
| db\_allocated\_storage | The size of the database (Gb) | `string` | `"5"` | no |
| db\_instance\_class | The database instance type | `string` | `"db.t2.small"` | no |
| db\_name | MySQL database name | `string` | `"artdb"` | no |
| db\_password | Database password | `string` | `"password"` | no |
| db\_user | Database user name | `string` | `"artifactory"` | no |
| sse\_algorithm | The type of encryption algorithm to use | `string` | `"aws:kms"` | no |
| ssl\_certificate | To use Artifactory as docker registry you need to provide wild card valid Certificate. Provide your SSL Certificate. | `string` | `"<cert contents>"` | no |
| ssl\_certificate\_key | Provide your SSL Certificate key | `string` | `"<cert contents>"` | no |
| subnet\_ids | n/a | `list` | n/a | yes |
| vpc\_cidr | n/a | `list` | n/a | yes |
| vpc\_id | n/a | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
