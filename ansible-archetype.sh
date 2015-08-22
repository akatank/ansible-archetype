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

- hosts: ${NAME_OF_PROJECT}
  roles:
    - ${NAME_OF_PROJECT}
EOF

mkdir ${NAME_OF_PROJECT}/roles
mkdir ${NAME_OF_PROJECT}/roles/${NAME_OF_PROJECT}
mkdir ${NAME_OF_PROJECT}/roles/${NAME_OF_PROJECT}/tasks
cat > ${NAME_OF_PROJECT}/roles/${NAME_OF_PROJECT}/tasks/main.yml <<EOF
---
# file: ${NAME_OF_PROJECT}/roles/${NAME_OF_PROJECT}/tasks/main.yml


EOF

mkdir ${NAME_OF_PROJECT}/roles/${NAME_OF_PROJECT}/meta
cat > ${NAME_OF_PROJECT}/roles/${NAME_OF_PROJECT}/meta/main.yml <<EOF
---
# file: ${NAME_OF_PROJECT}/roles/${NAME_OF_PROJECT}/meta/main.yml


EOF

mkdir ${NAME_OF_PROJECT}/roles/${NAME_OF_PROJECT}/files
mkdir ${NAME_OF_PROJECT}/roles/${NAME_OF_PROJECT}/templates
