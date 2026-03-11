# Ansible Playbooks and Roles Overview

![Stars](https://img.shields.io/github/stars/DurianLAB/ansible) ![Forks](https://img.shields.io/github/forks/DurianLAB/ansible) ![Issues](https://img.shields.io/github/issues/DurianLAB/ansible) ![Pull Requests](https://img.shields.io/github/issues-pr/DurianLAB/ansible)

## Roles Testable with Molecule

| Role                  | Molecule Testable | Used in Playbooks |
|-----------------------|-------------------|-------------------|
| ansible-user-setup    | No                | playbook-setup.yml |
| argocd-deploy         | No                | playbook-argocd.yml |
| clear-syslog          | Yes               | playbook-local.yml |
| docker-install        | Yes               | playbook-runner.yml, playbook-local.yml |
| github-actions-runner | Yes               | None |
| jenkins-helm          | Yes               | playbook-jenkins.yml |
| logrotate-custom      | Yes               | None |
| nginx-ingress-helm    | Yes               | playbook-nginx-ingress.yml |
| portforward_lxc       | No                | playbook-port-forwarding.yml |
| trilium_helm_deployment | No              | playbook-trilium.yml |

Note: playbook-microk8s.yml does not use any roles.

## Roadmap

- Phase 1: Getting microk8s role working ( WIP )
- Phase 2: Getting helm role installed ( DONE )
- Phase 3: Initial install jenkins ( DONE )

## Dynamic Inventories

This project includes a dynamic inventory script that fetches host information from an LXC server.

### Setup

Configure the LXC server in `inventory_scripts/lxc_inventory.sh`:

```bash
LXC_HOST="192.168.1.206"
SSH_USER="anpham"
```

Add your node names to the `DEV_NODES` and `PROD_NODES` arrays.

### Testing

List all hosts:
```bash
ansible-inventory -i inventory_scripts/lxc_inventory.sh --list
```

Ping all dev nodes:
```bash
ansible -i inventory_scripts/lxc_inventory.sh lxc_dev_cluster -m ping
```

Ping all prod nodes:
```bash
ansible -i inventory_scripts/lxc_inventory.sh lxc_prod_cluster -m ping
```
