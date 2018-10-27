provider "google" {
  version = "1.4.0"

  project = "${var.project}"
  region = "${var.region}"
}



resource "google_compute_project_metadata" "ssh_keys" {
    metadata {
      ssh-keys = <<EOF
      gceuser:${var.public_key} gceuser
      gceuser1:${var.public_key} gceuser1
      gceuser2:${var.public_key} gceuser2
      EOF
    }
}
resource "google_compute_instance" "app" {
  name         = "reddit-app-${count.index+1}"
  machine_type = "f1-micro"
  zone         = "${var.zone}"
  count        = "${var.instance_count}"

  metadata {
    ssh-keys = "gceuser:${file(var.public_key_path)}"
  }

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      #image = "reddit-base"
      image = "${var.disk_image}"
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {}
  }

  tags = ["reddit-app"]

  connection {
    type        = "ssh"
    user        = "gceuser"
    agent       = false
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default" # Название сети, в которой действует правило   
  network = "default"            # Какой доступ разрешить   

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  # Каким адресам разрешаем доступ   
  source_ranges = ["0.0.0.0/0"]

  # Правило применимо для инстансов с перечисленными тэгами   
  target_tags = ["reddit-app"]
}
