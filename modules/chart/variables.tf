variable "name" {
  description = "Release name."
  type        = string
  required    = true
}

variable "chart" {
  description = "Chart name to be installed. The chart name can be local path, a URL to a chart, or the name of the chart if repository is specified. "
  type        = string
  required    = true
}

variable "repository" {
  description = "(Optional) Repository URL where to locate the requested chart."
  type        = string
  default     = null
}

variable "ns" {
  description = "The namespace to install the release into."
  type        = string
  required    = true
}
