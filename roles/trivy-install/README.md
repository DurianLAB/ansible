# Trivy Operator Install Role

This Ansible role installs the Trivy Operator using Helm on Kubernetes clusters.

## Requirements

- Ansible >= 2.9
- Kubernetes cluster access
- Helm installed on the control node
- `kubernetes.core` Ansible collection

## Role Variables

### Helm Settings
- `trivy_helm_release_name`: Helm release name (default: trivy-operator)
- `trivy_helm_namespace`: Namespace to install in (default: trivy-system)
- `trivy_helm_create_namespace`: Create namespace if it doesn't exist (default: true)
- `trivy_helm_wait`: Wait for deployment to complete (default: true)
- `trivy_helm_wait_timeout`: Timeout for waiting (default: 300s)

### Chart Repository
- `trivy_repo_name`: Helm repo name (default: aquasecurity)
- `trivy_repo_url`: Helm repo URL (default: https://aquasecurity.github.io/helm-charts)
- `trivy_chart_name`: Chart name (default: trivy-operator)
- `trivy_chart_version`: Chart version (default: 0.29.0)

### Custom Values
- `trivy_helm_values`: Dictionary of custom Helm values (default: {})

## Example Playbook

```yaml
- hosts: k8s-masters
  roles:
    - role: trivy-install
      trivy_helm_values:
        operator:
          scannerReportTTL: "24h"
```

## License

MIT