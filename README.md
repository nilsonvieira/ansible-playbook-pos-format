# Introduction
## Requisites
### Install Needed Packs
```bash
sudo apt install openssh-server git ansible
```
### Configure Authorized_keys
The _authorized_keys_ file needed been created on folder `/home/$USER/.ssh/` into user on server/computer.

This file can neeeded permissions 600:
```bash
sudo chmod 600 $HOME/.ssh/authorized_keys
```

# How to use this Playbook
## Change IP
Edit IP for remote use. Add the IP for your remote Host on file `hosts`

## Add SSH Agent on Environment

```bash
eval `ssh-agent`
ssh-add
``````

## Execute Playbook
```bash
ansible-playbook -i hosts playbook.yml -e usuario=$USER --ask-become-pass
```
# Distro Tests
- Pop!_OS 22.04
- Ubuntu 22.04 
- Linux Mint 20
