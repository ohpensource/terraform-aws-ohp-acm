locals {

  certificate_name = var.host_name == "*" ? "wildcard" : var.host_name
}
