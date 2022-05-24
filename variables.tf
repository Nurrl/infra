variable "minio_ssl_cert_path" {
  description = "The local path to the SSL certificate file."
  type        = string
  nullable    = false
}

variable "minio_ssl_key_path" {
  description = "The local path to the SSL private key file."
  type        = string
  nullable    = false
}