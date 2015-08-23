### Ansible Archetype

Creates a new Ansible project. Will prompt for a project name if none is given.

Usage:
    ansible-archetype [project_name]

Uses the following structure:

    project_name/
      - files/
      - meta/
        - main.yml
      - tasks/
        - main.yml
      - templates/
      Vagrantfile

The Vagrantfile generated uses a Fedora 21 server fresh install box (jk563/fedora21). For more details on the box see [akatank/packer_fedora_21_vagrant](https://github.com/akatank/packer_fedora_21_vagrant)
