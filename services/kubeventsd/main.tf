resource "helm_release" "chart" {
  name  = "kubeventsd"
  chart = "${path.module}/kubeventsd/chart"

  # Issue a `helm dependency update` before templating
  dependency_update = true

  lint             = true
  wait             = false
  namespace        = "kubeventsd"
  create_namespace = true

  values = [yamlencode({ kubeventsd = { config = yamldecode(data.template_file.config.rendered) } })]

  set { # Set version for the alerting daemon
    name  = "image.tag"
    value = "0.0.2"
  }

  set_sensitive {
    name  = "secret.data.MATRIX_PASSWORD"
    value = var.password
  }
}
