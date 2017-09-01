# kubernetes_ansible

## Description

[![Ansible Galaxy](https://img.shields.io/badge/galaxy-sbouii.kubernetes-blue.svg)](https://galaxy.ansible.com/sbouii/kubernetes/)  
[![Build Status](https://travis-ci.org/sbouii/kubernetes-ansible.svg?branch=master)](https://travis-ci.org/sbouii/kubernetes-ansible)

This is an ansible role to set up a kubernetes master and monitor its componments on several GNU/Linux systems.

Although there are many ansible roles for installing kubernetes even production-ready ones , this version is mine , created for specific need.Besides automating the installation of kubernetes using  **[Kubeadm](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/)** and deploying Grafana and Prometheus pods for monitoring the componments of the kubernetes master and the application running on it,
it uses the infrastructure testing tool **[KitchenCi](http://kitchen.ci/)** to verify if the master is well setup and configured as expected.
For testing purposes I have deployed a multi-architecture application .

## Requirements

### Software Requirements

- **Python 2.7** or higher

- **Ansible 2.0** or higher (can be easily installed via pip. E.g: sudo pip install ansible==2.0.0.2)

- **[Vagrant](https://www.vagrantup.com/) 1.7** or higher 

- **Virtualbox**


## Supported Systems

- Debian
- Ubuntu
- Centos

More infos in the role's metadata file.

### Dependencies

None.

## Role variables

- **`kubernetes_debian_repositoy_filename`** - the filename of the kubernetes debian repository 
- **`kubernetes_redhat_repositoy_name`** - a unique kubernetes redhat repository ID
- **`kubernetes_redhat_repositoy_description`** - a description for the kubernetes redhat repository

## Available tags

- **`kubernetes-setup`** - Specify this tag to perform the kubernetes master setup
- **`kubernetes-config`** - Specify this tag for deploying application and monitoring pods 

## Usage

In order to set up a kubernetes master across your plateform, start by checking out the role from Ansible galaxy:
```bash
ansible-galaxy install sbouii.kubernetes_ansible
```

Finally call the role within you Ansible playbook:
```yaml
---
- hosts: localhost
  sudo: yes
  roles:
    - kubernetes_ansible
```

## Development and Testing
### Test with Vagrant
For quick tests, you can spin up a Debian VM using Vagrant. You maybe need to adapt the Vagrantfile to suit your environment (IP addresses, etc).

    $ vagrant up
  
### Run acceptance tests

For runing Acceptance/Integration tests against your role , we use the tool `test-kitchen`.All written acceptance tests are in the **./test/integration/** directory.

The `.kitchen.yml` file describes the testing configuration and the list of suite tests to run. By default, the instances will be converged with Ansible and ran in Vagrant virtual machines.

To list the instances:

    $ kitchen list

    Instance                    Driver   Provisioner      Verifier  Transport  Last Action
    default-debian-8-x64        Vagrant  AnsiblePlaybook  Busser    Ssh        <Not Created>
    ...

To run the default test suite, for instance, on a Ubuntu Trusty platform, run the following command:

    $ kitchen test default-ubuntu-1404-x64

## Author information

This role was created by [Mariem Sbouii](https://www.linkedin.com/in/mariem-sboui-76906711b) ,a DevOps enthusiast.
