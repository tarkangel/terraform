provider "google" {
  credentials = file("/home/tarkangel/.config/gcloud/legacy_credentials/angel_calderon5@hotmail.com/adc.json")
  project     = "virtual-flux-414904"
  region      = "us-central1"
}

resource "google_storage_bucket" "unique_bucket" {
  name     = "unique-test-bucket-123"
  location = "US"
}

resource "google_compute_instance" "example_instance" {
  name         = "example-instance-123"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}
