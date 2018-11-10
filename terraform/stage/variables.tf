variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  #default     = "europe-west1"
  default     = "asia-east1"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable public_key {
  description = "public key"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable zone {
  description = "Zone"
  #default     = "europe-west1-b"
  default     = "asia-east1-b"
}

variable instance_count {
  description = "instance count"
  default     = 1
}

variable static_ip {
  description = "static public IP"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db"
}
