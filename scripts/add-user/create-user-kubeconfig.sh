# prepare new $username-kubeconfig
export KUBECONFIG=$result_dir/$username-config

# create new kube config
touch $result_dir/$username-config

# set cluster
kubectl config set-cluster $cluster_name \
    --server=$cluster_addess \
    --certificate-authority=$PWD/ca.crt \
    --embed-certs=true

# set a user entry in kubeconfig
kubectl config set-credentials $username \
    --client-certificate=$result_dir/$username.crt \
    --client-key=$result_dir/$username.key \
    --embed-certs=true

# set a context entry in kubeconfig
kubectl config set-context $username-context \
    --cluster=$cluster_name \
    --user=$username \
    --namespace $namespace

# set $username-context as current and default
kubectl config use-context $username-context