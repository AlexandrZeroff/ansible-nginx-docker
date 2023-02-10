# ansible-nginx-docker

This project contains vagrant-described environment with various quantity of VMs and [Ansible](https://docs.ansible.com/) roles for managing servers and [Docker](https://docs.docker.com/) containers.

Ansible roles  to perform next tasks:
- setup and run Nginx server on VM
- setup and run Nginx server in docker container on VM

Requirements
------------

This role has only been tested on Ubuntu 16.04. Since this uses Ansible's
docker module, you will need to ensure that a recent-ish version of `docker-py`
and `docker` are installed.

You can use also `ansible-galaxin install -r tests/requirements.yml` or better add the same content to your own `requirements.yml` file in your own repository.

Examples
--------

Use it in a playbook as follows, depending on what tasks you need to do:

```yaml
- name: Basic setup and nginx installation
  hosts: clean_nodes
  gather_facts: True
  become: yes
  become_user: root
  roles:
   - basic-setup
   - clear-nginx
    
    
- name: Basic setup, docker engine install and nginx
  hosts: docker_nodes
  gather_facts: True
  become: yes
  roles:
    - basic-setup
    - docker-install
    - nginx-docker
```

Have a look at the [defaults/main.yml](defaults/main.yml) for role variables
that can be overridden! If you need a playbook to set Docker itself, have a
look at
[docker-install](https://github.com/AlexandrZeroff/ansible-nginx-docker/tree/master/ansible/roles/docker-install) role.

Expected to Be Configured
-------------------------

* `nginx_base_directory`:  remote folder to store temporary files
  * `nginx_data_directory`: remote folder on Nginx server to store server data
  * `nginx_exposed_volumes`: lsit of mounted docker volumes
  * `nginx_conf`: Nginx server configuration
