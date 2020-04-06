export OCP_RELEASE=4.3.0-x86_64
export LOCAL_REGISTRY='registry.ocp15.example.com:5000' 
export LOCAL_REPOSITORY='ocp15/openshift4' 
export PRODUCT_REPO='openshift-release-dev' 
export LOCAL_SECRET_JSON=${HOME}/pull-secret-2.json
export RELEASE_NAME="ocp-release" 

echo "oc adm -a ${LOCAL_SECRET_JSON} release mirror \
     --from=quay.io/${PRODUCT_REPO}/${RELEASE_NAME}:${OCP_RELEASE} \
     --to=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY} \
     --to-release-image=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY}:${OCP_RELEASE}"

oc adm -a ${LOCAL_SECRET_JSON} release mirror \
     --from=quay.io/${PRODUCT_REPO}/${RELEASE_NAME}:${OCP_RELEASE} \
     --to=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY} \
     --to-release-image=${LOCAL_REGISTRY}/${LOCAL_REPOSITORY}:${OCP_RELEASE}

