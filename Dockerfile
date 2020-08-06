FROM nvidia/cuda:8.0-runtime-ubuntu16.04
RUN apt-get update && \
    apt-get install -y python3.5 libpython3.5 python3-pip
RUN mkdir -p /opt/clevr /opt/clevr/models /opt/clevr/input /opt/clevr/output /opt/clevr/scratch
WORKDIR /opt/clevr
ADD requirements.txt /opt/clevr
RUN pip3 install -r requirements.txt
ENV PYTHONPATH=/opt/clevr
ADD . /opt/clevr
CMD python3 scripts/run_model.py \
    --use_gpu 0 \
    --baseline_model models/CLEVR/cnn_lstm.pt \
    --image img/CLEVR_val_000013.png \
    --question "Does the small sphere have the same color as the cube left of the gray cube?"