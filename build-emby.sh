kubectl apply -f metallb-native.yaml

export KUBECONFIG=/home/caue/.kube/config.yam
kubectl apply -f emby-deployment.yaml
kubectl apply -f emby-service.yaml
kubectl apply -f emby-ingress.yaml