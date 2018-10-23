provider "google" {
    version = "1.4.0"
    project = "infra-219514"
    region = "europe-west1"
}

resource "google_compute_instance" "app" {
    name = "reddit-app"
    machine_type = "f1-micro"
    zone = "europe-west1-b"
    # определение загрузочного диска
    boot_disk {
        initialize_params {
            image = "reddit-base"
        }
    }
    # определение сетевого интерфейса
    network_interface {
        # сеть, к которой присоединить данный интерфейс
        network = "default"
        # использовать ephemeral IP для доступа из Интернет
        access_config {}
    }  
}