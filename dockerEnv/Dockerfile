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
    software-properties-common \
    python3.13 \
    python3-pip \
    python3-graph-tool && \
    rm -rf /var/lib/apt/lists/*



RUN pip install -r requirements.txt

EXPOSE 8888

#CMD [ "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root" ]