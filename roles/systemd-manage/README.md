# systemd-manage

An Ansible role to manage systemd services.

## Variables

- `systemd_service_name`: The name of the systemd service to manage (required)
- `systemd_state`: The desired state of the service (started, stopped, restarted, reloaded). Default: started
- `systemd_enabled`: Whether the service should be enabled at boot (yes/no). Default: yes
- `systemd_daemon_reload`: Whether to reload the systemd daemon before managing the service (yes/no). Default: no

## Example Playbook

```yaml
- hosts: servers
  roles:
    - role: systemd-manage
      systemd_service_name: nginx
      systemd_state: started
      systemd_enabled: yes
```