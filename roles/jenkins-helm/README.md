# Jenkins Helm Role

This Ansible role deploys Jenkins using Helm.

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

## Deployment

This role executes on the Ansible controller (usually localhost) and deploys Jenkins to the Kubernetes cluster via Helm using the `kubernetes.core` collection. Ensure `kubectl` is configured to access your target cluster (e.g., via `KUBECONFIG` environment variable) before running the playbook.

## Example Playbook

```yaml
- hosts: localhost
  connection: local
  roles:
    - role: jenkins-helm
      jenkins_helm_values:
        controller:
          adminUser: admin
          adminPassword: password
```

## License

MIT