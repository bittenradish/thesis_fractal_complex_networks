FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /workdir

COPY . .

LABEL version="1.0"

LABEL description="docker image for Master thesis"

RUN apt-get update && apt-get install -y \
    software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y \
    python3.13 \
    python3-pip
    #python3-graph-tool

RUN pip install -r requirements.txt

EXPOSE 8888

#CMD [ "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root" ]