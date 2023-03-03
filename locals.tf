# The external load-balancer configuration
locals {
  charts = {
    minio = {
      name  = "MinIO"
      chart = "file://./charts/minio"
      ns    = "r-minio"
    }
  }

  loadbalancer = {
    ip = "10.0.9.1"
  }
}
