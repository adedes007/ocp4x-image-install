export OCP_RELEASE=4.2.2
export IMAGE_REPO=/root/scripts/images-repo
export LOCAL_REGISTRY=registry.ocp15.example.com:5000
export AIRGAP_SECRET_2_JSON=/root/scripts/pull-secret-2.json

cd ${IMAGE_REPO}/${RELEASE}

ls | xargs -L1 -I {} skopeo copy --authfile=${AIRGAP_SECRET_2_JSON} docker-archive:/${IMAGE_REPO}/${RELEASE}/{} docker://${LOCAL_REGISTRY}/ocp15/openshift4:{}

