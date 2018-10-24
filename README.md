# anton-iv_infra
anton-iv Infra repository

Task 1 solution: need to create .ssh/config with folowing contents:

Host bastion
  User gceuser
  Hostname 35.206.158.95

Host someinternalhost
  User gceuser
  Hostname 10.132.0.3
  Port 22
  ProxyCommand ssh bastion nc -w 120 %h %p

Now we can use ssh bastion and ssh someinternalhost.

bastion_IP = 35.206.158.95
someinternalhost_IP = 10.132.0.3

testapp_IP = 35.241.166.155
testapp_port = 9292

gcloud compute firewall-rules create "default-puma-server" --allow tcp:9292 --source-ranges="0.0.0.0/0" --target-tags="puma-server"
gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=f1-micro --tags puma-server --restart-on-failure --metadata-from-file startup-script=../../../../otus/anton-iv_infra/startup.sh
git update-index --chmod=+x *.sh

reddit-base template created, reddit-full template based on reddit-base templ. created; created puma.service file for autodeployment of reddit app;

Many SSH-keys solution:
resource "google_compute_project_metadata" "ssh_keys" {
    metadata {
      ssh-keys = <<EOF
      gceuser:${var.public_key} gceuser
      gceuser1:${var.public_key} gceuser1
      gceuser2:${var.public_key} gceuser2
      EOF
    }
}
Where public_key = "ssh-rsa HERE_PUBLIC_KEY"

