# Create an A record for the domain
resource "cloudflare_record" "a_domain" {
  zone_id = var.cloudflare_zone_id
  allow_overwrite = true
  name    = var.domain
  type    = "A"
  value   = var.public_ip
  # ttl     = 5
  proxied = false
}

# Create an CNAME record for the wildcard domain
resource "cloudflare_record" "cname_wildcard_domain" {
  zone_id = var.cloudflare_zone_id
  allow_overwrite = true
  name    = "*.${var.domain}"
  type    = "CNAME"
  value   = var.domain
  # ttl     = 5
  proxied = false
}
