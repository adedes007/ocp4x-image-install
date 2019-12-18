export OCP_RELEASE=4.2.2
export IMAGE_REPO=/root/scripts/image-repo
export RELEASE=quay.io/openshift-release-dev/ocp-release:${OCP_RELEASE}
export AIRGAP_SECRET_JSON=/root/scripts/pull-secret.json

rm -rf ${IMAGE_REPO}/${OCP_RELEASE}/*
mkdir -p ${IMAGE_REPO}/${OCP_RELEASE}

for i in $( oc adm release info -a ${AIRGAP_SECRET_JSON} ${RELEASE} -o pullspec ); do
  skopeo copy --authfile=${AIRGAP_SECRET_JSON} docker://$i docker-archive://${IMAGE_REPO}/${OCP_RELEASE}/${i: -20}
done

skopeo copy --authfile=/root/scripts/pull-secret.json docker://${RELEASE} docker-archive://root/scripts/images-repo/${OCP_RELEASE}/${OCP_RELEASE}

