FROM ubuntu:18.04

USER root

RUN apt-get update && apt-get install apt-transport-https ca-certificates gnupg curl python3 strongswan strongswan-pki libstrongswan-extra-plugins unzip libcharon-extra-plugins libcharon-standard-plugins libstrongswan-standard-plugins strongswan-charon strongswan-starter strongswan-scepclient strongswan-swanctl -y docker.io

ENV PATH $PATH:/gcloud/google-cloud-sdk/bin

RUN apt-get upgrade coreutils -y

RUN curl https://sdk.cloud.google.com > install.sh && bash install.sh --disable-prompts --install-dir=/gcloud && chmod 755 -R /gcloud && gcloud components update --quiet --version=351.0.0 && gcloud components install --quiet beta && gcloud components install --quiet alpha

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN useradd -ms /bin/bash lernmi

WORKDIR /home/lernmi
