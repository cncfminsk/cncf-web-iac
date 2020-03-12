resource "cloudflare_record" "cncfminsk-io" {
  zone_id = lookup(data.cloudflare_zones.cncfminsk-io.zones[0], "id")
  name    = "cncfminsk.io"
  value   = "192.0.2.1"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "www-cncfminsk-io" {
  zone_id = lookup(data.cloudflare_zones.cncfminsk-io.zones[0], "id")
  name    = "www"
  value   = "c.storage.googleapis.com"
  type    = "CNAME"
  proxied = true
}

resource "google_storage_bucket" "www-cncfminsk-io" {
  name     = "www.cncfminsk.io"
  location = "EU"

  versioning {
    enabled = true
  }

  website {
    main_page_suffix = "index.html"
  }
}

resource "cloudflare_record" "dev-cncfminsk-io" {
  zone_id = lookup(data.cloudflare_zones.cncfminsk-io.zones[0], "id")
  name    = "dev"
  value   = "c.storage.googleapis.com"
  type    = "CNAME"
  proxied = true
}

resource "google_storage_bucket" "dev-cncfminsk-io" {
  name     = "dev.cncfminsk.io"
  location = "EU"

  versioning {
    enabled = false
  }

  website {
    main_page_suffix = "index.html"
  }
}