# OpenCost Helm Role

This Ansible role deploys OpenCost using Helm.

## Requirements

- Ansible >= 2.9
- Kubernetes cluster access
- Helm installed
- kubernetes.core collection: `ansible-galaxy collection install kubernetes.core`

## Role Variables

- `opencost_helm_release_name`: Helm release name (default: opencost)
- `opencost_helm_namespace`: Namespace for deployment (default: opencost)
- `opencost_helm_create_namespace`: Create namespace if it doesn't exist (default: true)
- `opencost_helm_wait`: Wait for deployment to complete (default: true)
- `opencost_helm_wait_timeout`: Timeout for wait (default: 300s)
- `opencost_repo_name`: Helm repo name (default: opencost)
- `opencost_repo_url`: Helm repo URL (default: https://opencost.github.io/opencost-helm-chart)
- `opencost_chart_name`: Chart name (default: opencost)
- `opencost_helm_values`: Custom values for the chart (default: {})

## Deployment

This role executes on the Ansible controller (usually localhost) and deploys OpenCost to the Kubernetes cluster via Helm using the `kubernetes.core` collection. Ensure `kubectl` is configured to access your target cluster (e.g., via `KUBECONFIG` environment variable) before running the playbook.

## Example Playbook

```yaml
- hosts: localhost
  connection: local
  roles:
    - role: opencost-helm
      opencost_helm_values:
        opencost:
          exporter:
            cloudProviderApiKey: "your-api-key"
```

## License

MIT