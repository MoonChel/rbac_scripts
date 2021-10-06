# Subject entries
# O — Organization or in our case Kubernetes namespace
# CN — Common Name (eg: the main domain the certificate should cover) or in our case username or group name

# generate a Client Sign Request (CSR)
openssl req -new -key $result_dir/$username.key -out $result_dir/$username.csr -config $PWD/csr.cnf

# prepare certificate signing request and wait for approval
export USERNAME_CERT=$(cat $result_dir/$username.csr | base64 | tr -d '\n')

cat $PWD/templates/certificate-signing-request.yaml | envsubst | kubectl create -f -

# approve by kubectl with admin permissions
kubectl certificate approve $username-csr

sleep 5

# store approved $username certificate at your local machine
kubectl get csr $username-csr -o jsonpath='{.status.certificate}' | base64 --decode > $result_dir/$username.crt
