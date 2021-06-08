variable "tags" {
  type        = map(any)
  description = "(Required) Map of tags to apply to repository"
}
variable "subject_alternative_names" {
  description = "(Optional) Set of domains that should be SANs in the issued certificate"
  type        = list(any)
  default     = []
}

variable "domain_name" {
  description = "(Required) Domain zone name"
  type        = string
}

variable "host_name" {
  description = "(Required) Hostname"
  type        = string
}

variable "wait_for_validation" {
  description = "(Optional) Domain validation check will be skipped"
  default     = false
}

variable "certificate_transparency_logging_preference" {
  description = "(Optional) Specifies whether certificate details should be added to a certificate transparency log"
  type        = string
  default     = null
}

