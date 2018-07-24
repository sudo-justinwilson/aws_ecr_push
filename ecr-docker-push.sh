#!/bin/bash -x

aws='/usr/bin/aws'
TAG=${1}
URL=${2}

# build image in local context ($PWD):
#docker build -t "${TAG}:$(date -I)" .
docker build -t "${TAG}" .

# tag image:
# docker tag justin-test:latest 325438770462.dkr.ecr.ap-southeast-2.amazonaws.com/justin-test:latest
#docker tag ${TAG}:$(date -I) ${URL}
docker tag ${TAG}:latest ${URL}

# login to docker ECR:
$(aws ecr get-login --no-include-email)

# push local image to ECR docker repo:
# docker push 325438770462.dkr.ecr.ap-southeast-2.amazonaws.com/justin-test:latest
#docker push ${URL}/${TAG}:$(date -I)
#docker push ${URL}:$(date -I)
docker push ${URL}:latest
#docker push ${URL}
