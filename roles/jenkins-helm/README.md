# Jenkins Helm Role

This Ansible role deploys Jenkins using Helm.

> **⚠️ Day 1 Installation Only**  
> This role is designed for initial deployment only. It is **NOT** intended for ongoing maintenance or configuration updates. Running this role multiple times will:
> - **Override the PVC (PersistentVolumeClaim)** - existing Jenkins data will be lost
> - Uninstall and reinstall the Helm release
> - Reset configuration

## Requirements

- Ansible >= 2.9
- Kubernetes cluster access
- Helm installed
- kubernetes.core collection: `ansible-galaxy collection install kubernetes.core`

## Role Variables

- `jenkins_helm_release_name`: Helm release name (default: jenkins)
- `jenkins_helm_namespace`: Namespace for deployment (default: jenkins)
- `jenkins_helm_create_namespace`: Create namespace if it doesn't exist (default: true)
- `jenkins_helm_wait`: Wait for deployment to complete (default: true)
- `jenkins_helm_wait_timeout`: Timeout for wait (default: 300s)
- `jenkins_repo_name`: Helm repo name (default: jenkins)
- `jenkins_repo_url`: Helm repo URL (default: https://charts.jenkins.io)
- `jenkins_chart_name`: Chart name (default: jenkins)
- `jenkins_helm_values`: Custom values for the chart (default: {})
- `jenkins_kubeconfig`: Path to kubeconfig file (default: /home/ansible/.kube/config)

## Deployment

This role executes on the Ansible controller (usually localhost) and deploys Jenkins to the Kubernetes cluster via Helm using the `kubernetes.core` collection. Ensure `kubectl` is configured to access your target cluster (e.g., via `KUBECONFIG` environment variable) before running the playbook.

## Important Notes

- **PVC Override**: The role uninstalls existing Helm release and deletes PVC before reinstalling. All Jenkins data is lost on re-run.
- **JCasC**: Configuration as Code is supported via `jenkins_helm_values.controller.JCasC`
- **Kubeconfig**: Ensure kubeconfig is available at `jenkins_kubeconfig` path on the target host

## Example Playbook

```yaml
- hosts: localhost
  connection: local
  roles:
    - role: jenkins-helm
      jenkins_helm_values:
        controller:
          JCasC:
            enabled: true
            configScripts:
              jenkins-config: |
                jenkins:
                  systemMessage: "Jenkins configured by Ansible"
                  securityRealm:
                    local:
                      allowsSignup: false
                      users:
                        - id: "admin"
                          password: "your-password"
                  authorizationStrategy:
                    loggedInUsersCanDoAnything:
                      allowAnonymousRead: false
```

## License

MIT