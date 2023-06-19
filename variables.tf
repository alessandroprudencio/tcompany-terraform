variable "prefix" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "log_retention_days" {
  type = number
}

variable "desired_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "max_unavailable" {
  type = number
}
