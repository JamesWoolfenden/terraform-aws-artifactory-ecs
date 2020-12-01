# terraform-aws-artifactory-ecs

How
<https://github.com/jfrog/JFrog-Cloud-Installers/tree/aws-jcr-7.5.5/JFrogContainerRegistry/aws/container>
<https://aws-quickstart.s3.amazonaws.com/quickstart-jfrog-artifactory/templates/jfrog-artifactory-ecs-existing-vpc.template.yaml>

## masterkey

You need to specify your own master key for your container:

```shell
# Create a key
export MASTER_KEY=$(openssl rand -hex 32)
echo ${MASTER_KEY}
```

Important **Ensure Cluster instance role give cloudwatch logs access**

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | 3.17.0 |

## Providers

| Name | Version |
|------|---------|
| aws | 3.17.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_cidr | n/a | `list` | n/a | yes |
| cluster\_arn | n/a | `string` | n/a | yes |
| common\_tags | n/a | `map` | `{}` | no |
| db\_allocated\_storage | The size of the database (Gb) | `string` | `"5"` | no |
| db\_instance\_class | The database instance type | `string` | `"db.t2.small"` | no |
| db\_name | MySQL database name | `string` | `"artdb"` | no |
| db\_password | Database password | `string` | `"password"` | no |
| db\_user | Database user name | `string` | `"artifactory"` | no |
| instance\_SG | n/a | `string` | n/a | yes |
| instances | n/a | `list` | n/a | yes |
| master\_key | n/a | `string` | n/a | yes |
| outbound | n/a | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| record | n/a | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| retention\_in\_days | n/a | `string` | `180` | no |
| ssl\_certificate\_id | n/a | `string` | n/a | yes |
| subnet\_ids | n/a | `list` | n/a | yes |
| targetgroup\_http\_name | n/a | `string` | `"artifactoryhttp"` | no |
| targetgroup\_ssl\_name | n/a | `string` | `"artifactoryssl"` | no |
| vpc\_id | n/a | `string` | n/a | yes |
| zone\_id | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cluster | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
