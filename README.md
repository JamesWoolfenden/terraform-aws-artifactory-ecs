# terraform-aws-artifactory-ecs

How
<https://github.com/jfrog/JFrog-Cloud-Installers/tree/aws-jcr-7.5.5/JFrogContainerRegistry/aws/container>
<https://aws-quickstart.s3.amazonaws.com/quickstart-jfrog-artifactory/templates/jfrog-artifactory-ecs-existing-vpc.template.yaml>

## master key

You need to specify your own master key for your container:

```shell
# Create a key
export MASTER_KEY=$(openssl rand -hex 32)
echo ${MASTER_KEY}
```

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
| ssh\_cidr | n/a | `list` | n/a | yes |
| subnet\_ids | n/a | `list` | n/a | yes |
| vpc\_id | n/a | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
