#!/bin/bash


#if [[ "$1" == '--list' ]]; then
#    cd ~/otus/anton-iv_infra/terraform/stage
#    terraform state pull > ../../ansible/curr.tfstate
#    ~/otus/anton-iv_infra/ansible/terraform.py --list 
#fi

#WSL version
if [[ "$1" == '--list' ]]; then
    export GOOGLE_APPLICATION_CREDENTIALS="/home/anton/Infra-fde35889f605.json"
    cd /mnt/c/Users/anton/otus/anton-iv_infra/terraform/prod
    terraform state pull > ../../ansible/environments/prod/curr.tfstate
    /mnt/c/Users/anton/otus/anton-iv_infra/ansible/environments/prod/terraform.py --list 
fi

if [[ "$1" == '--file' ]]; then
    export GOOGLE_APPLICATION_CREDENTIALS="/home/anton/Infra-fde35889f605.json"
    cd /mnt/c/Users/anton/otus/anton-iv_infra/terraform/prod
    terraform state pull > ../../ansible/environments/prod/curr.tfstate
    /mnt/c/Users/anton/otus/anton-iv_infra/ansible/environments/prod/terraform.py --list > inv.json
fi


