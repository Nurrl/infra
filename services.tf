module "kubeventsd" {
  source = "./services/kubeventsd"

  homeserver = "https://matrix.org"
  room       = "!LwbxpnOrrfXiixdrnm:matrix.org"
  username   = "@zion.internal:matrix.org"
  password   = var.kubeventsd_matrix_password
}
