FROM ubuntu:18.04
LABEL MAINTAINER Hong-She Liang <starofrainnight@gmail.com>

ENV LANG C.UTF-8

RUN apt-get update && apt-get install --no-install-recommends -y --fix-missing \
    python3 python3-distutils python3-distutils-extra dmucs wget \
    && apt-get clean

RUN wget https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

RUN pip install -U setuptools
RUN easy_install -U pip
RUN pip install -U wheel
RUN pip install -U click

RUN mkdir /etc/dmucs

RUN mkdir -p /opt/docker-dmucs-dispatcher/
COPY entrypoint.py /opt/docker-dmucs-dispatcher/
WORKDIR /opt/docker-dmucs-dispatcher

EXPOSE 9714

VOLUME [ "/etc/dmucs" ]

ENTRYPOINT [ "python3", "entrypoint.py" ]
CMD ["dmucs", "-H", "/etc/dmucs/hosts-info"]
