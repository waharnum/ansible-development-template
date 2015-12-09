# Ansible Development Template

I find myself having to do this kind of thing over and over again when doing serious Ansible development (writing new roles and playbooks) or testing (especially reviewing the work of others), so am trying to capture it in a repo I can fork when needed to lower the start-up time.

## Setting up a New Project

- fork the repo
- customize `vm-inventory` with the appropriate directories where Vagrant will generate SSH keys for each box
- if desired, add or remove VMs from the Vagrantfile / inventory, change their IPs, whatever
  - A cooler project would do all this automatically from one file. At the moment that's not this project.
- `./up.sh`

## Developing roles and playbooks

- from the `roles` directory, `ansible-galaxy init {role name}`
- playbooks in the root directory
- `ansible-playbook {{ playbook-file }} -i vm-inventory`
- do whatever else you need to do

## Throwing the VMs away

- `vagrant destroy`
- `./up.sh`
