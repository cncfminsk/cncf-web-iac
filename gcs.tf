resource "cloudflare_record" "foobar" {
  zone_id = data.cloudflare_zones.cncfminsk-io.zone_id
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

resource "cloudflare_record" "foobar" {
  zone_id = data.cloudflare_zones.cncfminsk-io.zone_id
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