# Trivy Install Role

This Ansible role installs Trivy vulnerability scanner on Linux hosts.

## Requirements

- Ansible >= 2.9
- Supported OS: Ubuntu, CentOS, RedHat

## Role Variables

- `trivy_version`: Trivy version to install (default: 0.55.2)
- `trivy_install_path`: Path to install Trivy binary (default: /usr/local/bin)
- `trivy_arch`: System architecture (default: ansible_architecture)
- `trivy_os`: Operating system (default: ansible_system | lower)

## Example Playbook

```yaml
- hosts: servers
  roles:
    - role: trivy-install
      trivy_version: "0.55.2"
```

## License

MIT