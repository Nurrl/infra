resource "helm_release" "chart" {
  name       = var.name
  chart      = var.chart
  repository = var.repository

  dependency_update = true
  create_namespace  = true
  namespace         = var.ns
  timeout           = 300
  atomic            = true
  lint              = true
}
