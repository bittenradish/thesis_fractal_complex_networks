FROM ubuntu:22.04

# Set environment variables to non-interactive
ENV DEBIAN_FRONTEND=noninteractive

LABEL version="1.0"

LABEL description="docker image for Master thesis"

# Update the package list and install required packages
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    wget \
    software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && apt-get install -y \
    python3.13 \
    python3-pip && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://downloads.skewed.de/skewed-keyring/skewed-keyring_1.1_all_$(lsb_release -s -c).deb && \
    dpkg -i skewed-keyring_1.1_all_$(lsb_release -s -c).deb && \
    echo "deb [signed-by=/usr/share/keyrings/skewed-keyring.gpg] https://downloads.skewed.de/apt $(lsb_release -s -c) main" > \
    /etc/apt/sources.list.d/skewed.list && \
    apt-get update && apt-get install -y \
    python3-graph-tool=2.33

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}


RUN pip install -r requirements.txt


#CMD [ "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root" ]