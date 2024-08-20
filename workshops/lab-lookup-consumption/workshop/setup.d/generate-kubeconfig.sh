#!/bin/bash

mkdir -p ~/.kube

export KUBECONFIG=/opt/clusters/hub/config:/opt/clusters/cluster-1/config:/opt/clusters/cluster-2/config

kubectl config view --raw > ~/.kube/config
