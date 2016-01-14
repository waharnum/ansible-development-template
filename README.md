# Ansible Development Template

I found myself having to do this frequently when doing serious Ansible development (writing new roles and playbooks) or testing (reviewing the work of others), so have captured it in a repo to reuse as needed to lower the start-up time.

## Requirements

- Vagrant / VirtualBox
- Ansible

## What It Does Out of the Box
- sets up three VMs with private networking
- confirms Ansible can connect to them
- you should then be able to manage the VMs as though they're remote servers

## Setting up a New Project

- clone the repo, or fork it, or whatever!
- create a new branch to do the work in for creating test playbooks, inventories, etc that will not form part of the complete distributed role (`git checkout -b {{ role_name }}` or similar)
    - the role itself is easier to manage if created as a separate repo and added as a submodule (see below)
- customize `vm-inventory` with the appropriate directories where Vagrant will generate SSH keys for each box
- if desired, add or remove VMs from the Vagrantfile / inventory, change their IPs, whatever
  - A cooler project would do all this automatically from one file. At the moment that's not this project.
- Run `./up.sh`

## Developing roles and playbooks

- create a separate repo for the role
    - `git submodule` it in the /roles directory
- playbooks in the root directory
- `ansible-playbook {{ playbook-file }} -i vm-inventory`
- do whatever else you need to do and separately commit your clean roles without surrounding test playbooks / inventories

## Testing the roles of others

- from the root:
    - `ansible-galaxy install {{ role_repo }} -p roles`
- this gets you a copy of the role that you can reference in test playbooks

## Throwing the VMs away

This setup provides three separate VMs out of the box to give you some leeway in having "clean" environments to test Ansible playbooks & roles against, but if you need to

- `vagrant destroy` and confirm you want to destroy each VM (or `vagrant destroy -f` if you're really certain)
- Run `./up.sh` again to rebuild fresh VMs
