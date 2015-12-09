#!/bin/bash
echo "Clearing the vagrant box IPs from known hosts"
ssh-keygen -R 192.168.88.10 && ssh-keygen -R 192.168.88.11 && ssh-keygen -R 192.168.89.12
vagrant up
echo "Temporarily disabling Ansible host key checking for this terminal via env variable"
export ANSIBLE_HOST_KEY_CHECKING=False
echo "Running playbook-test.yml"
ansible-playbook playbook-test.yml -i vm-inventory
echo "Reenabling Ansible host key checking"
export ANSIBLE_HOST_KEY_CHECKING=True
