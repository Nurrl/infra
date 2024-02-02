
module "k8s" {
  source = "./k8s"

  address = "s.unw.re"
  port    = 223
}

provider "kubernetes" {
  host = module.k8s.endpoint

  username               = module.k8s.config.users[0].name
  cluster_ca_certificate = base64decode(module.k8s.config.clusters[0].cluster.certificate-authority-data)
  client_certificate     = base64decode(module.k8s.config.users[0].user.client-certificate-data)
  client_key             = base64decode(module.k8s.config.users[0].user.client-key-data)
}

provider "helm" {
  kubernetes {
    host = module.k8s.endpoint

    username               = module.k8s.config.users[0].name
    cluster_ca_certificate = base64decode(module.k8s.config.clusters[0].cluster.certificate-authority-data)
    client_certificate     = base64decode(module.k8s.config.users[0].user.client-certificate-data)
    client_key             = base64decode(module.k8s.config.users[0].user.client-key-data)
  }
}

# The cluster's internal communication CA.
module "ca" {
  source = "./ca"

  org = "k3s.zion.internal"
  cn  = "R0"
}


