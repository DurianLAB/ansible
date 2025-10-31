# helm-install

An Ansible role to install Helm CLI on Ubuntu systems.

## Requirements

- Ubuntu (focal or jammy)
- Ansible 2.1+

## Role Variables

None.

## Dependencies

None.

## Example Playbook

```yaml
- hosts: servers
  roles:
    - role: helm-install
```

## License

GPL-2.0-or-later