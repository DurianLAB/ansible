# NGINX Ingress Helm Role

This Ansible role deploys the NGINX Ingress Controller using Helm.

## Requirements

- Ansible >= 2.9
- Kubernetes cluster access
- Helm installed
- kubernetes.core collection: `ansible-galaxy collection install kubernetes.core`

## Role Variables

- `nginx_ingress_helm_release_name`: Helm release name (default: nginx-ingress)
- `nginx_ingress_helm_namespace`: Namespace for deployment (default: ingress-nginx)
- `nginx_ingress_helm_create_namespace`: Create namespace if it doesn't exist (default: true)
- `nginx_ingress_helm_wait`: Wait for deployment to complete (default: true)
- `nginx_ingress_helm_wait_timeout`: Timeout for wait (default: 300s)
- `nginx_ingress_repo_name`: Helm repo name (default: ingress-nginx)
- `nginx_ingress_repo_url`: Helm repo URL (default: https://kubernetes.github.io/ingress-nginx)
- `nginx_ingress_chart_name`: Chart name (default: ingress-nginx)
- `nginx_ingress_helm_values`: Custom values for the chart (default: {})

## Deployment

This role executes on the Ansible controller (usually localhost) and deploys the NGINX Ingress Controller to the Kubernetes cluster via Helm using the `kubernetes.core` collection. Ensure `kubectl` is configured to access your target cluster (e.g., via `KUBECONFIG` environment variable) before running the playbook.

## Example Playbook

```yaml
- hosts: localhost
  connection: local
  roles:
    - role: nginx-ingress-helm
      nginx_ingress_helm_values:
        controller:
          service:
            type: LoadBalancer
```

## License

MIT