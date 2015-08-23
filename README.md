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
      ansible.cfg
      project_name.yml
      Vagrantfile

The Vagrantfile generated uses a Fedora 21 server fresh install box ([jk563/fedora21](https://atlas.hashicorp.com/jk563/boxes/fedora21.json))[1]. After bringing up the box, Vagrant will then provision the box with the project directory acting as the role.

#### But why that structure?
This structure allows each role to be under its own source control. Each role can be developed separately and composed as needed to create larger roles or environments. This also allows each role to be built as an image using packer.

[1] For more details on the box see [akatank/packer_fedora_21_vagrant](https://github.com/akatank/packer_fedora_21_vagrant)
