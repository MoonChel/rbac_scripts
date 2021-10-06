result_dir=$PWD/results

source $PWD/scripts/add-user/base.sh
source $PWD/scripts/add-user/generate-user-private-key.sh
source $PWD/scripts/add-user/generate-and-approve-csr.sh
source $PWD/scripts/add-user/create-user-kubeconfig.sh
source $PWD/scripts/add-user/create-role-and-rolebinding.sh