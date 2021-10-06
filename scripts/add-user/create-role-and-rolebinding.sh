# switch to admin kubeconfig
export KUBECONFIG=

# Apply Role, "apply" is used to skip error if already created
cat $PWD/templates/roles/role-$role-template.yaml | envsubst | kubectl apply -f -

# Apply RoleBinding
cat $PWD/templates/rolebinding-template.yaml | envsubst | kubectl create -f -
