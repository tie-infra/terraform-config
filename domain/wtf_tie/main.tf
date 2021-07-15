terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

resource "cloudflare_zone" "default" {
  zone = "tie.wtf"
}

resource "cloudflare_zone_settings_override" "default" {
  zone_id = cloudflare_zone.default.id
  settings {
    ssl              = "strict"
    cname_flattening = "flatten_all"
  }
}
