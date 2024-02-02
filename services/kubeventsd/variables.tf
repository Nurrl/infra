variable "homeserver" {
  description = "The Matrix homeserver used for alerting"
  type        = string
}

variable "room" {
  description = "The Matrix room used for alerting"
  type        = string
}

variable "username" {
  description = "The Matrix account username used for alerting"
  type        = string
}

variable "password" {
  description = "The Matrix account password used for alerting"
  type        = string
  sensitive   = true
}
