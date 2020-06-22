FROM ubuntu:20.04
LABEL maintainer="coderpatros@outlook.com"

ENV SEQ_SERVER=
ENV SEQ_APIKEY=

COPY requirements.txt /tmp/requirements.txt

# Install Python and dependencies
RUN apt-get update && apt-get install -y \
        python3 \
        python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install -r /tmp/requirements.txt

COPY syslog_seq_forwarder.py /syslog_seq_forwarder.py

ENTRYPOINT [ "/syslog_seq_forwarder.py" ]