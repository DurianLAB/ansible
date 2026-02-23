#!/bin/bash

LXC_CONTAINER="k3s-dev-cluster-01"

if [[ "$1" == "--list" ]]; then
    IP=$(lxc list "$LXC_CONTAINER" --format csv 2>/dev/null | cut -d',' -f3 | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -1)
    
    cat <<EOF
{
  "lxc_dev_cluster": {
    "hosts": ["$LXC_CONTAINER"],
    "vars": {
      "ansible_user": "ansible",
      "ansible_ssh_private_key_file": "~/.ssh/id_ed25519",
      "ansible_ssh_common_args": "-o StrictHostKeyChecking=no"
    }
  },
  "_meta": {
    "hostvars": {
      "$LXC_CONTAINER": {
        "ansible_host": "$IP"
      }
    }
  }
}
EOF
elif [[ "$1" == "--host" ]]; then
    echo '{"ansible_host": "'"$(lxc list "$LXC_CONTAINER" --format csv 2>/dev/null | cut -d',' -f3 | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -1)"'"}'
fi
