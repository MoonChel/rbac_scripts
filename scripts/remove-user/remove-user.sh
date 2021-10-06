# switch to cluster context
kubectl config use-context $cluster_context

# delete role binding
kubectl delete rolebinding $namespace-$role-$username-rolebinding --namespace $namespace
