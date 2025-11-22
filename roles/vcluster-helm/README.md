# vCluster Helm Role

This Ansible role deploys vCluster using Helm.

## Requirements

- Ansible >= 2.9
- Kubernetes cluster access
- Helm installed
- kubernetes.core collection: `ansible-galaxy collection install kubernetes.core`

## Role Variables

- `vcluster_helm_release_name`: Helm release name (default: vcluster)
- `vcluster_helm_namespace`: Namespace for deployment (default: vcluster)
- `vcluster_helm_create_namespace`: Create namespace if it doesn't exist (default: true)
- `vcluster_helm_wait`: Wait for deployment to complete (default: true)
- `vcluster_helm_wait_timeout`: Timeout for wait (default: 300s)
- `vcluster_repo_name`: Helm repo name (default: loft-sh)
- `vcluster_repo_url`: Helm repo URL (default: https://charts.loft.sh)
- `vcluster_chart_name`: Chart name (default: vcluster)
- `vcluster_helm_values`: Custom values for the chart (default: {})

## Deployment

This role executes on the Ansible controller (usually localhost) and deploys vCluster to the Kubernetes cluster via Helm using the `kubernetes.core` collection. Ensure `kubectl` is configured to access your target cluster (e.g., via `KUBECONFIG` environment variable) before running the playbook.

## Example Playbook

```yaml
- hosts: localhost
  connection: local
  roles:
    - role: vcluster-helm
      vcluster_helm_values:
        vcluster:
          image: loftsh/vcluster:latest
```

## License

MIT