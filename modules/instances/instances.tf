resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "e2-standard-2"
  zone         = var.zone
  boot_disk {
    initialize_params { image = "debian-cloud/debian-11" }
  }
  network_interface {
    network    = "tf-vpc-858600"
    subnetwork = "subnet-01"
  } # Properly closed on a new line
  metadata_startup_script   = "#!/bin/bash"
  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "e2-standard-2"
  zone         = var.zone
  boot_disk {
    initialize_params { image = "debian-cloud/debian-11" }
  }
  network_interface {
    network    = "tf-vpc-858600"
    subnetwork = "subnet-02"
  } # Fixed the brace here
  metadata_startup_script   = "#!/bin/bash"
  allow_stopping_for_update = true
}

# NOTE: If this causes a "Module not found" error, move this block to your root main.tf
resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
  network = "tf-vpc-858600" # Using the name directly is safer if the module reference fails here

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
}