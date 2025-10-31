# MicroK8s Install Role

This Ansible role installs MicroK8s on Linux hosts.

## Requirements

- Ansible >= 2.9
- Supported OS: Ubuntu, Debian

## Role Variables

- `microk8s_channel`: MicroK8s channel to install (default: stable)

## Example Playbook

```yaml
- hosts: servers
  become: yes
  roles:
    - role: microk8s
      microk8s_channel: latest
```

## License

MIT