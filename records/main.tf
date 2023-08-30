module "router_records" {
  source               = "../modules/records_module_cf"
  cloudflare_api_token = var.cloudflare_api_token
  zone_name            = var.zone_name
  prefix_lb_name       = var.prefix_lb_name
  zone_id              = var.zone_id
  record_type          = var.record_type
  proxied_record       = var.proxied_record
  region_tenants_ids   = local.file_content
}