# anton-iv_infra
anton-iv Infra repository

Решение два-в-одном. Создаем файл ~/.ssh/config следующего содержания:

Host bastion
  User gceuser
  Hostname 35.206.158.95

Host someinternalhost
  User gceuser
  Hostname 10.132.0.3
  Port 22
  ProxyCommand ssh bastion nc -w 120 %h %p

Теперь можно пользоваться короткими командами ssh bastion и ssh someinternalhost.