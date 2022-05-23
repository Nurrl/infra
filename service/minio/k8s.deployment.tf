resource "kubernetes_deployment_v1" "minio" {
  metadata {
    name      = "minio"
    namespace = kubernetes_namespace_v1.self.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        pods = "minio"
      }
    }

    template {
      metadata {
        labels = {
          pods = "minio"
        }
      }

      spec {
        container {
          image = "minio/minio:latest"
          name  = "minio"
          args  = ["server", "/data", "--certs-dir", "/certs"]

          volume_mount {
            mount_path = "/data"
            name       = "data"
          }

          volume_mount {
            mount_path = "/certs"
            name       = "certs"
          }

          volume_mount {
            mount_path = "/certs/CAs"
            name       = "ca"
          }

          port {
            container_port = 9000
            host_ip        = "0.0.0.0"
            host_port      = 5901
          }

          liveness_probe {
            http_get {
              scheme = "HTTPS"
              path   = "/minio/health/live"
              port   = 9000
            }

            initial_delay_seconds = 20
            period_seconds        = 10
            failure_threshold     = 3
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "512M"
            }

            requests = {
              cpu    = "10m"
              memory = "128M"
            }
          }
        }

        volume {
          name = "data"

          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim_v1.minio.metadata[0].name
          }
        }

        volume {
          name = "certs"

          secret {
            secret_name = kubernetes_secret_v1.certificates.metadata[0].name

            items {
              key  = "public.crt"
              mode = "0444"
              path = "public.crt"
            }

            items {
              key  = "private.key"
              mode = "0400"
              path = "private.key"
            }
          }
        }

        volume {
          name = "ca"

          empty_dir {}
        }

        restart_policy = "Always"
      }
    }
  }
}
