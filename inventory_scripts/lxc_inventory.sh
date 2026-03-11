#!/bin/bash

LXC_HOST="192.168.1.206"
SSH_USER="anpham"

DEV_NODES=("k3s-dev-node-1" "k3s-dev-node-2" "k3s-dev-node-3")
PROD_NODES=("k3s-prod-node-1" "k3s-prod-node-2" "k3s-prod-node-3")

get_ip() {
    local node=$1
    ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 ${SSH_USER}@${LXC_HOST} lxc list "$node" --format csv 2>/dev/null | cut -d',' -f3 | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -1
}

if [[ "$1" == "--list" ]]; then
    echo "{"
    echo "  \"lxc_dev_cluster\": {"
    echo "    \"hosts\": ["
    for i in "${!DEV_NODES[@]}"; do
        node="${DEV_NODES[$i]}"
        ip=$(get_ip "$node")
        if [[ -n "$ip" ]]; then
            [[ $i -gt 0 ]] && echo ","
            echo -n "      \"$node\""
        fi
    done
    echo ""
    echo "    ],"
    echo "    \"vars\": {"
    echo "      \"ansible_user\": \"ansible\","
    echo "      \"ansible_ssh_private_key_file\": \"~/.ssh/id_ed25519\","
    echo "      \"ansible_ssh_common_args\": \"-o StrictHostKeyChecking=no\""
    echo "    }"
    echo "  },"
    echo "  \"lxc_prod_cluster\": {"
    echo "    \"hosts\": ["
    for i in "${!PROD_NODES[@]}"; do
        node="${PROD_NODES[$i]}"
        ip=$(get_ip "$node")
        if [[ -n "$ip" ]]; then
            [[ $i -gt 0 ]] && echo ","
            echo -n "      \"$node\""
        fi
    done
    echo ""
    echo "    ],"
    echo "    \"vars\": {"
    echo "      \"ansible_user\": \"ansible\","
    echo "      \"ansible_ssh_private_key_file\": \"~/.ssh/id_ed25519\","
    echo "      \"ansible_ssh_common_args\": \"-o StrictHostKeyChecking=no\""
    echo "    }"
    echo "  },"
    echo "  \"_meta\": {"
    echo "    \"hostvars\": {"
    
    first=true
    for node in "${DEV_NODES[@]}" "${PROD_NODES[@]}"; do
        ip=$(get_ip "$node")
        if [[ -n "$ip" ]]; then
            [[ $first == false ]] && echo ","
            echo "      \"$node\": {"
            echo "        \"ansible_host\": \"$ip\""
            echo -n "      }"
            first=false
        fi
    done
    echo ""
    echo "    }"
    echo "  }"
    echo "}"
    
elif [[ "$1" == "--host" ]]; then
    node=$2
    ip=$(get_ip "$node")
    echo "{\"ansible_host\": \"$ip\"}"
fi
