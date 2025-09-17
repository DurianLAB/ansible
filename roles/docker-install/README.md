# Docker Install Role

This Ansible role installs Docker Engine on Linux hosts.

## Requirements

- Ansible >= 2.9
- Supported OS: Ubuntu, CentOS, RedHat

## Role Variables

- `docker_version`: Docker version to install (default: latest)
- `docker_users`: List of users to add to docker group (default: [])
- `docker_compose_install`: Whether to install Docker Compose (default: false)
- `docker_compose_version`: Docker Compose version (default: 2.17.3)

## Example Playbook

```yaml
- hosts: servers
  roles:
    - role: docker-install
      docker_users:
        - ubuntu
      docker_compose_install: true
```

## License

MIT