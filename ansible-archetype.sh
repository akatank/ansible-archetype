#!/usr/bin/env bash

# Prompt for name if not already supplied
if [[ -z ${1} ]] ; then
  read -p "What do you want to name your project? : " NAME_OF_PROJECT
else
  NAME_OF_PROJECT=${1}
fi

# Check directory doesn't already exist
if [[ -d ${NAME_OF_PROJECT} ]]; then
  echo "Directory already exists. Exiting."
  exit 1
fi

# Ansible Structure
mkdir ${NAME_OF_PROJECT}
cat > ${NAME_OF_PROJECT}/${NAME_OF_PROJECT}.yml <<EOF
---
# file: ${NAME_OF_PROJECT}.yml

- hosts: all
  roles:
    - ${NAME_OF_PROJECT}
EOF

mkdir ${NAME_OF_PROJECT}/tasks
cat > ${NAME_OF_PROJECT}/tasks/main.yml <<EOF
---
# file: tasks/main.yml

EOF

mkdir ${NAME_OF_PROJECT}/meta
cat > ${NAME_OF_PROJECT}/meta/main.yml <<EOF
---
# file: meta/main.yml

EOF

mkdir ${NAME_OF_PROJECT}/files
mkdir ${NAME_OF_PROJECT}/templates
mkdir ${NAME_OF_PROJECT}/vars

# Vagrantfile
cat > ${NAME_OF_PROJECT}/Vagrantfile <<EOF
Vagrant.configure(2) do |config|

  config.vm.box="jk563/fedora21"
  config.vm.box_url="https://atlas.hashicorp.com/jk563/boxes/fedora21.json"

  config.vm.provision "ansible" do |ansible|
      ansible.playbook = "${NAME_OF_PROJECT}.yml"
  end
end
EOF

# Ansible config
cat > ${NAME_OF_PROJECT}/ansible.cfg <<EOF
[defaults]
roles_path = ..
EOF
