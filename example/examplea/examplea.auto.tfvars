
allowed_cidr = ["86.157.143.246/32", "86.147.65.243/32"]
common_tags = {
"createby" = "Terraform" }
/*subnet_ids = [
  "subnet-0a2bf4e5f2f153cd0",
  "subnet-0fadf50b7807d44a6", ]
vpc_id = "vpc-0c1c08b21f9e2eb85"
*/

subnet_ids   = ["subnet-069e041ace652987c", "subnet-0d8ab46f677777501"]
vpc_id       = "vpc-0bf7dacf63f99adc3"
master_key   = "3f135dcd508bb4154718f5b8fa14fa77d46c08acd5dc036b2a19e443318eab48"
region       = "eu-west-2"
cluster_name = "artifactory"
instances = [
  "i-03c83b6a0c347cc2f",
]

instance_SG = "sg-0ed3f3a246ecb2eb5"
ssl_certificate_id = "arn:aws:acm:eu-west-2:680235478471:certificate/772b2402-5d4a-457f-829c-02550c8c9244"
zone_id            = "Z0613304D03LG1SU5BI"
record             = "artifact.freebeer.site"
