#oc adm -a ${LOCAL_SECRET_JSON} release extract --command=openshift-install "${LOCAL_REGISTRY}/${LOCAL_REPOSITORY}:${OCP_RELEASE}"
export OCP_RELEASE=4.3.0-x86_64
export LOCAL_REGISTRY='registry.ocp15.example.com:5000'
export LOCAL_REPOSITORY='ocp15/openshift4'
export PRODUCT_REPO='openshift-release-dev'
export LOCAL_SECRET_JSON=${HOME}/pull-secret-2.json
export RELEASE_NAME="ocp-release"

oc adm -a ${LOCAL_SECRET_JSON} release extract --command=openshift-install "${LOCAL_REGISTRY}/${LOCAL_REPOSITORY}:${OCP_RELEASE}"
rm -rf /var/www/html/4.3.1/openshift-install-4.3.1
cp openshift-install /var/www/html/4.3.1/openshift-install-4.3.1

#rm -rf /var/www/html/4.2.16/openshift-install-4.2.16
#cp openshift-install /var/www/html/4.2.16/openshift-install-4.2.16

restorecon -R /var/www/html

#export OCP_RELEASE="4.2.16-x86_64"
#export AIRGAP_REG='registry.ocp15.example.com:5000'
#export AIRGAP_REPO='ocp15/openshift4'
#export UPSTREAM_REPO='openshift-release-dev'
#export AIRGAP_SECRET_JSON="${HOME}/pull-secret-2.json"
#export OPENSHIFT_INSTALL_RELEASE_IMAGE_OVERRIDE=${AIRGAP_REG}/${AIRGAP_REPO}:${OCP_RELEASE}
#export RELEASE_NAME="ocp-release"


