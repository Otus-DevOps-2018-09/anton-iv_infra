provider "google" {
  version = "1.4.0"

  project = "infra-219514"
  region  = "europe-west1"
}

resource "google_compute_firewall" "firewall_ssh" {
  name    = "default-allow-ssh-sec"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
