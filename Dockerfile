FROM kiwigrid/gcloud-kubectl-helm:3.3.4-312.0.0-267

USER root

RUN apk add --upgrade coreutils

