# switch to cluster context
kubectl config use-context $cluster_context

# delete csr request
kubectl delete certificatesigningrequests $username-csr

# delete role binding
kubectl delete rolebinding $namespace-$role-$username-rolebinding --namespace $namespace
