project = "heimdall"
region  = "ap-northeast-2"
env     = "prod"

create_s3_bucket = true
s3_bucket_name = "dabbi-terraform"
dynamo_table_maps= {
  vpc_subnets = {
    name = "heimdall-prod-infra-network"
  }
  eks = {
    name = "heimdall-prod-eks"
  }
  ebs = {
    name = "heimdall-aws-ebs-csi-driver"
  }
  external_dns = {
    name = "heimdall-external-dns"
  }
  alb = {
    name = "heimdall-aws-load-balancer-controller"
  }
}
