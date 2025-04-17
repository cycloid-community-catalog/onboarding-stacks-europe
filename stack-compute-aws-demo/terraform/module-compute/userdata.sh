#!/bin/bash
# To install SSM Agent on Debian Server
# https://docs.aws.amazon.com/systems-manager/latest/userguide/agent-install-deb.html
mkdir /tmp/ssm
cd /tmp/ssm
wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb
dpkg -i amazon-ssm-agent.deb
systemctl status amazon-ssm-agent
systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent
# Install K3s if enabled
if [[ "$INSTALL_K3S" -eq "true" ]]; then
    IPADDR=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
    mkdir -p ~/.ssh
    echo "${SSH_PRIVATE_KEY}" >~/.ssh/git
    chmod 600 ~/.ssh/git
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/git
    ssh-keyscan -t rsa ${IPADDR} >> ~/.ssh/known_hosts
    echo "Installing K3s..."
    ssh ${USERNAME}@${IPADDR} "curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE='644' INSTALL_K3S_EXEC='--disable traefik --disable servicelb --tls-san ${IPADDR}' sh -s -"
    ssh ${USERNAME}@${IPADDR} "until sudo ls /etc/rancher/k3s/k3s.yaml >/dev/null; do sleep 1; done"
    ssh ${USERNAME}@${IPADDR} "mkdir -p ~/.kube && sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config && sudo chmod 644 ~/.kube/config"
    mkdir -p ~/.kube
    scp ${USERNAME}@${IPADDR}:~/.kube/config ~/.kube/config
    sed -i "s/127.0.0.1/${IPADDR}/" ~/.kube/config
    echo "Saving kubeconfig in Credential ${PROJECT}-${ENV}-kubeconfig"
    if ! cy credential create --name "${PROJECT}-${ENV}-kubeconfig" --canonical "${PROJECT}-${ENV}-kubeconfig" custom --field-file kubeconfig=~/.kube/config; then
        echo "Error: cy returned code $?. Trying to update it."
        if ! cy credential update --name "${PROJECT}-${ENV}-kubeconfig" --canonical "${PROJECT}-${ENV}-kubeconfig" custom --field-file kubeconfig=~/.kube/config; then
            echo "Error: cy returned code $?"
            exit 1
        fi
    fi
    helm upgrade --set controller.hostPort.enabled=true --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
    echo "Kubernetes Dashbord installed. To access it, run kubectl proxy and go to http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
fi