# anton-iv_infra
anton-iv Infra repository

������� ���-�-�����. ������� ���� ~/.ssh/config ���������� ����������:

Host bastion
  User gceuser
  Hostname 35.206.158.95

Host someinternalhost
  User gceuser
  Hostname 10.132.0.3
  Port 22
  ProxyCommand ssh bastion nc -w 120 %h %p

������ ����� ������������ ��������� ��������� ssh bastion � ssh someinternalhost.