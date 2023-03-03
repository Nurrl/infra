module "secrets" {
  source = "./secrets"

  minio = {
    ip        = [local.loadbalancer.ip]
    hostnames = []
  }
}
