data "template_file" "config" {
  template = file("${path.module}/config.yaml.tpl")

  vars = {
    homeserver = var.homeserver
    username   = var.username
    room       = var.room
  }
}
