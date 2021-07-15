terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

locals {
  prefix     = "2a02:2168:8fec:f600::/64"
  prefix_isp = "2a02:2168:a0f:a2a3::/64"
}

resource "cloudflare_zone" "default" {
  zone = "tie.rip"
}

resource "cloudflare_record" "roku_aaaa1" {
  zone_id = cloudflare_zone.default.id
  name    = "roku"
  value   = cidrhost(local.prefix, 1)
  type    = "AAAA"
}

resource "cloudflare_record" "roku_aaaa2" {
  zone_id = cloudflare_zone.default.id
  name    = "roku"
  value   = cidrhost(local.prefix_isp, 3)
  type    = "AAAA"
}

resource "cloudflare_record" "roku_a1" {
  zone_id = cloudflare_zone.default.id
  name    = "roku"
  value   = "95.84.246.62"
  type    = "A"
}

resource "cloudflare_record" "ubernet_aaaa2" {
  zone_id = cloudflare_zone.default.id
  name    = "ubernet"
  value   = cidrhost(local.prefix_isp, 4)
  type    = "AAAA"
}

resource "cloudflare_record" "ubernet_a1" {
  zone_id = cloudflare_zone.default.id
  name    = "ubernet"
  value   = "188.32.206.130"
  type    = "A"
}

resource "cloudflare_record" "madara_aaaa1" {
  zone_id = cloudflare_zone.default.id
  name    = "madara"
  value   = cidrhost(local.prefix, parseint("942", 16))
  type    = "AAAA"
}

resource "cloudflare_record" "saitama_aaaa1" {
  zone_id = cloudflare_zone.default.id
  name    = "saitama"
  value   = cidrhost(local.prefix, parseint("39f", 16))
  type    = "AAAA"
}

resource "cloudflare_record" "saitama_a1" {
  zone_id = cloudflare_zone.default.id
  name    = "saitama"
  value   = "188.255.3.141"
  type    = "A"
}

resource "cloudflare_record" "tatsuya_aaaa1" {
  zone_id = cloudflare_zone.default.id
  name    = "tatsuya"
  value   = cidrhost(local.prefix, parseint("39f", 16))
  type    = "AAAA"
}

resource "cloudflare_record" "tatsuya_a1" {
  zone_id = cloudflare_zone.default.id
  name    = "tatsuya"
  value   = "37.110.66.21"
  type    = "A"
}
