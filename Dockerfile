FROM kiwigrid/gcloud-kubectl-helm:3.3.4-312.0.0-267

USER root

RUN apk add --upgrade coreutils
RUN gcloud components update --quiet --version=351.0.0
RUN gcloud components install --quiet beta
RUN gcloud components install --quiet alpha

