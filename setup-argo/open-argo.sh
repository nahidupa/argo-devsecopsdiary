open http://localhost:2741
kubectl --context kind-kind-argo -n argo port-forward deployment/argo-server 2741:2746
