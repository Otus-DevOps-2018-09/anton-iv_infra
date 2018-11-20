#!/bin/bash


#if [[ "$1" == '--list' ]]; then
#    cd ~/otus/anton-iv_infra/terraform/stage
#    terraform state pull > ../../ansible/curr.tfstate
#    ~/otus/anton-iv_infra/ansible/terraform.py --list 
#fi

#WSL version
if [[ "$1" == '--list' ]]; then
    export GOOGLE_APPLICATION_CREDENTIALS="/home/anton/Infra-fde35889f605.json"
    cd /mnt/c/Users/anton/otus/anton-iv_infra/terraform/stage
    terraform state pull > ../../ansible/environments/stage/curr.tfstate
    /mnt/c/Users/anton/otus/anton-iv_infra/ansible/environments/stage/terraform.py --list 
fi

if [[ "$1" == '--file' ]]; then
    export GOOGLE_APPLICATION_CREDENTIALS="/home/anton/Infra-fde35889f605.json"
    cd /mnt/c/Users/anton/otus/anton-iv_infra/terraform/stage
    terraform state pull > ../../ansible/environments/stage/curr.tfstate
    /mnt/c/Users/anton/otus/anton-iv_infra/ansible/environments/stage/terraform.py --list > /mnt/c/Users/anton/otus/anton-iv_infra/ansible/environments/stage/inv.json
fi


