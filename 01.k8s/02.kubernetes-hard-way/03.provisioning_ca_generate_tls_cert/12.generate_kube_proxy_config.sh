#!/bin/bash 

KUBERNETES_PUBLIC_ADDRESS=10.0.3.2

{
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=../pki/ca.pem \
    --embed-certs=true \
    --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
    --kubeconfig=kube-proxy.kubeconfig

  kubectl config set-credentials system:kube-proxy \
    --client-certificate=../pki/kube-proxy.pem \
    --client-key=../pki/kube-proxy-key.pem \
    --embed-certs=true \
    --kubeconfig=kube-proxy.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-proxy \
    --kubeconfig=kube-proxy.kubeconfig

  kubectl config use-context default --kubeconfig=kube-proxy.kubeconfig

  mv kube-proxy* ../config 
  ls -al ../config/kube-p*

}
