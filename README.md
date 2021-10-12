# Create RoleBinding for a user

```bash
bash commands/add-user.sh -u john-wick -n staging -r read -c minikube -s https://127.0.0.1:49606

Usage: $0
    -u john
    -n staging/production
    -r read/write
    -c cluster_name
    -s cluster_addess

-u = username, part of email - username@company.com, only alphanumeric and \"-\" are supported
-n = namespace, default is default
-r = role - read, write
-c = cluster_name - from .kube/config: clusters->cluster->name
-s = cluster address - from .kube/config: clusters->cluster->server
```

# Revoke RoleBinging

```bash
bash commands/remove-user.sh -u john-wick -n staging -r read -c minikube

Usage: $0
    -u john
    -n staging/production
    -r read/write
    -c cluster_context

-u = username, part of email - username@company.com, only alphanumeric and \"-\" are supported
-n = namespace, default is default
-r = role - read, write
-c = cluster_context -  from which cluster you want to remove role binding
                        from .kube/config: contexts->context->name
```


# Example workflow

Preparation:

- copy certificate ca.crt from your Kubernetes cluster
- make sure namespace does exist

```bash
minikube delete

minikube start

kubectl create namespace staging

bash commands/add-user.sh -u john-wick -n staging -r read -c minikube -s https://127.0.0.1:50092

# check with

kubectl --kubeconfig results/john-wick-config config get-contexts

# or

kubectl --kubeconfig results/john-wick-config create -f https://k8s.io/examples/application/deployment.yaml

# remove with

bash commands/remove-user.sh -u john-wick -n staging -r read -c minikube
```
