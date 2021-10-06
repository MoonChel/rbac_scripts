# args parsing
usage() {
    echo """
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
    """ 1>&2;

    exit 0;
}

[ $# -eq 0 ] && usage

# if email is vladimir.chernenko@company.com
# then username must be vladimir.chernenko
# this will help in the future with automating role binding removal:
#    filter by username and remove role binding

while getopts u:n:r:c:s: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
        n) namespace=${OPTARG};;
        r) role=${OPTARG};;
        c) cluster_name=${OPTARG};;
        s) cluster_addess=${OPTARG};;
    esac
done

# The variable OPTIND holds the number of options parsed by the last call to getopts.
# It is common practice to call the shift command at the end of your processing loop
#    to remove options that have already been handled from $@.
shift $((OPTIND -1))

# set default if undefined
if [ -z "$namespace" ]
then
    namespace="default"
fi

export USERNAME="$username"
export NAMESPACE="$namespace"
export ROLE="$role"
