output "router_record_name" {
  value = cloudflare_record.records.*.name
}