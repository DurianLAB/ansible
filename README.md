# Ansible Playbooks and Roles Overview

![Pull Requests](https://img.shields.io/github/issues-pr/DurianLAB/ansible)

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
