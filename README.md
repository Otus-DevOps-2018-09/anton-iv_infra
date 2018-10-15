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