#Install Argo Workflows

kubectl --context kind-kind-argo create ns argo
kubectl --context kind-kind-argo apply -n argo -f https://raw.githubusercontent.com/argoproj/argo/stable/manifests/quick-start-postgres.yaml


kubectl --context kind-kind-argo  create rolebinding default-admin \
  --clusterrole cluster-admin \
  --namespace argo \
  --serviceaccount=argo:default


kubectl --context kind-kind-argo patch configmap workflow-controller-configmap \
  --namespace argo \
  --patch '{"data": {"containerRuntimeExecutor": "k8sapi"}}' \
  --type merge