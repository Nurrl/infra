terraform {
  required_providers {
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
  }
}
