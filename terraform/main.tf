provider "google" {
    version = "1.4.0"
    project = "infra-219514"
    region = "europe-west1"
}

resource "google_compute_instance" "app" {
    name = "reddit-app"
    machine_type = "f1-micro"
    zone = "europe-west1-b"
    metadata {    
         ssh-keys = "gceuser:${file("~/.ssh/gceuser.pub")}"   
    } 
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
    tags = ["reddit-app"] 
}

resource "google_compute_firewall" "firewall_puma" {  
    name    = "allow-puma-default" # Название сети, в которой действует правило   
    network = "default" # Какой доступ разрешить   
    allow {    
         protocol = "tcp"    
         ports    = ["9292"]  
    } 
    # Каким адресам разрешаем доступ   
    source_ranges = ["0.0.0.0/0"] 
    # Правило применимо для инстансов с перечисленными тэгами   
    target_tags = ["reddit-app"] 
}