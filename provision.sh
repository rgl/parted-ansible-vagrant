#!/bin/bash
set -euxo pipefail

cd /vagrant

ansible-inventory --list --yaml

ansible-playbook playbook.yml --diff #-vvv
