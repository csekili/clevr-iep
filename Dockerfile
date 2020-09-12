FROM nvidia/cuda:8.0-runtime-ubuntu16.04
RUN apt-get update && \
    apt-get install -y python3.5 libpython3.5 python3-pip
RUN mkdir -p /opt/clevr /opt/clevr/models /opt/clevr/input /opt/clevr/output /opt/clevr/scratch
WORKDIR /opt/clevr
ADD requirements.txt /opt/clevr
RUN pip3 install -r requirements.txt
ENV PYTHONPATH=/opt/clevr
ADD . /opt/clevr