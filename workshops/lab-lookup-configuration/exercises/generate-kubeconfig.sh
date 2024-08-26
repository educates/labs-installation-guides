#!/bin/bash

# Generate a kubeconfig file from the lookup service remote access token. 
# The resulting kubeconfig is output to stdout.

# Parse the command line options to get the name of the context to be used.
# If an alternate kubeconfig file for accessing the cluster needs to be used
# then set the KUBECONFIG environment variable to the path of the kubeconfig.

CONTEXT=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --context)
      shift
      CONTEXT=$1
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
  shift
done

# Complain if options are missing.

if [[ -z $CONTEXT ]]; then
  echo "The --context option must be specified."
  exit 1
fi

# Generate the kubeconfig file for the lookup service remote access token in the
# educates namespace. Generate any temporary files into a temporary directory
# for this scripts that is cleaned up on completion.

TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT

# Get the token for the service account.

kubectl --context $CONTEXT -n educates get secret remote-access-token -o jsonpath='{.data.token}' | base64 -d > $TMPDIR/token

# Get the certificate authority data for the service account.

kubectl --context $CONTEXT -n educates get secret remote-access-token -o jsonpath='{.data.ca\.crt}' > $TMPDIR/ca.crt

# Work out the name of the cluster for the context.

CLUSTER_NAME=$(kubectl --context $CONTEXT -n educates config view -o jsonpath='{.contexts[?(@.name=="'$CONTEXT'")].context.cluster}')

# Lookup the server URL for the cluster.

SERVER_URL=$(kubectl --context $CONTEXT -n educates config view -o jsonpath='{.clusters[?(@.name=="'$CLUSTER_NAME'")].cluster.server}')

# Generate the kubeconfig file.

cat > $TMPDIR/kubeconfig <<EOF
apiVersion: v1
kind: Config
clusters:
- name: training-platform
  cluster:
    certificate-authority-data: $(cat $TMPDIR/ca.crt)
    server: $SERVER_URL
contexts:
- name: training-platform
  context:
    cluster: training-platform
    user: remote-access
current-context: training-platform
users:
- name: remote-access
  user:
    token: $(cat $TMPDIR/token)
EOF

# Output the kubeconfig file to stdout.

cat $TMPDIR/kubeconfig
