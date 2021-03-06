#!/bin/bash
set -euxo pipefail

# install ansible.
# see https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-with-pip
apt-get install -y --no-install-recommends \
    python3-pip \
    python3-cryptography \
    python3-openssl \
    python3-yaml \
    pylint \
    sshpass
# NB this pip install will display several "error: invalid command 'bdist_wheel'"
#    messages, those can be ignored.
python3 -m pip install \
    -r /vagrant/requirements.txt
ansible-galaxy collection install \
    -r /vagrant/requirements.yml \
    -p /usr/share/ansible/collections
install -d /etc/ansible
ansible --version
ansible -m ping localhost

# install the ansible shell completion helpers.
install -d /etc/bash_completion.d
apt-get install -y python3-argcomplete
activate-global-python-argcomplete3
