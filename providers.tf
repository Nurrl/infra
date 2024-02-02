terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = module.k8s.endpoint
    username               = module.k8s.config.users.0.name
    client_certificate     = base64decode(module.k8s.config.users.0.user["client-certificate-data"])
    client_key             = base64decode(module.k8s.config.users.0.user["client-key-data"])
    cluster_ca_certificate = base64decode(module.k8s.config.clusters.0.cluster["certificate-authority-data"])
  }
}
