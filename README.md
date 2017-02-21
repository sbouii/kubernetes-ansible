# kubernetes_monitoring

## Description

[![Ansible Galaxy](https://img.shields.io/badge/galaxy-sbouii.kubernetes_monitoring-blue.svg)](https://galaxy.ansible.com/sbouii/kubernetes_monitoring/)

this is an ansible role to set up a kubernetes cluster and monitor its componments.


## Requirements

### Software Requirements

- **Python 2.7** or higher

- **Ansible 2.0** or higher (can be easily installed via pip. E.g: sudo pip install ansible==2.0.0.2)

- **[Vagrant](https://www.vagrantup.com/) 1.7** or higher 

- **Virtualbox**

##Supported Systems
- Debian
- Ubuntu
- Centos

More infos in the role's metadata file.

##Role variables

##Available tags

##Usage
In order to set up a kubernetes cluster across your plateform, start by checking out the role from Ansible galaxy:
```bash
ansible-galaxy install sbouii.kubernetes_monitoring
```

Finally call the role within you Ansible playbook:
```yaml
---
- hosts: all
  roles:
    - kubernetes_monitoring
```

##Development and Testing
###Run acceptance tests
For runing Acceptance/Integration tests against your role , we use the tool `test-kitchen`.All written acceptance tests are in the **./test/integration/** directory.

The `.kitchen.yml` file describes the testing configuration and the list of suite tests to run. By default, the instances will be converged with Ansible and ran in Vagrant virtual machines.

To list the instances:

    $ kitchen list

    Instance                    Driver   Provisioner      Verifier  Transport  Last Action
    default-debian-8-x64        Vagrant  AnsiblePlaybook  Busser    Ssh        <Not Created>
    ...

To run the default test suite, for instance, on a Ubuntu Trusty platform, run the following command:

    $ kitchen test default-ubuntu-1404-x64

##Author information

This role was created by [Mariem Sboui](https://www.linkedin.com/in/mariem-sboui-76906711b) ,a DevOps enthusiast.
