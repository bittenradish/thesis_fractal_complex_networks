FROM ubuntu:22.04

WORKDIR /workdir

COPY . .

LABEL version="1.0"

LABEL description="docker image for Master thesis"

RUN apt-get upgrade && apt-get install -y \
    python3.12.4 \
    python3-pip \
    python3-graph-tool

RUN pip install -r requirements.txt

EXPOSE 8888

#CMD [ "jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root" ]