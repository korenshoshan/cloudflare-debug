locals {
  tenants = flatten([
    for region, tenant_list in var.region_tenants_ids : [
      for tenant in tenant_list : {
        region = region
        tenant = tenant
      }
    ]
  ])
}

resource "cloudflare_record" "records" {
  count           = length(local.tenants)
  allow_overwrite = false
  zone_id         = var.zone_id
  type            = var.record_type
  proxied         = var.proxied_record

  name  = local.tenants[count.index].tenant
  value = "${var.prefix_lb_name}-${local.tenants[count.index].region}.${var.zone_name}"
}

resource "cloudflare_regional_hostname" "regional_hostname" {
  depends_on = [cloudflare_record.records]
  count      = length(local.tenants)
  zone_id    = var.zone_id
  hostname   = "${local.tenants[count.index].tenant}.${var.zone_name}"
  region_key = local.tenants[count.index].region
}
