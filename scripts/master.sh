#!/bin/bash

# This script is for Control Plane (Master) server

set -euxo pipefail

MASTER_IP="192.168.56.20"
NODENAME=$(hostname -s)
POD_CIDR="10.244.0.0/16"

sudo kubeadm config images pull

echo "Preflight Check Passed: Downloaded All Required Images"

sudo kubeadm init --apiserver-advertise-address=$MASTER_IP --apiserver-cert-extra-sans=$MASTER_IP --pod-network-cidr=$POD_CIDR --node-name "$NODENAME"

mkdir -p "$HOME"/.kube
sudo cp -i /etc/kubernetes/admin.conf "$HOME"/.kube/config
sudo chown "$(id -u)":"$(id -g)" "$HOME"/.kube/config

# Install Calico Network Plugin Network 

kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml

