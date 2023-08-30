variable "cloudflare_api_token" {
  type        = string
  default     = ""
  description = "Take the API token from the cloudflare account."
}

variable "zone_id" {
  type        = string
  default     = ""
  description = "site zone id."
}

variable "zone_name" {
  description = "The top-level domain (zone name) for the records"
  type        = string
}

variable "prefix_lb_name" {
  description = "The prefix for the lb name"
  type        = string
}

variable "lb_name_output" {
  type        = list(any)
  default     = [""]
  description = "Get from the output the list of lb names"
}

variable "record_type" {
  type        = string
  default     = ""
  description = "CNAME/ A"
}

variable "proxied_record" {
  type        = bool
  description = "Define if the record will be proxied."
}

variable "region_tenants_ids" {
  type        = map(any)
  default     = {}
  description = "All tenant names by regions."
}

locals {
  file_content = jsondecode(file("${path.module}/region_tenants_ids.json"))
}