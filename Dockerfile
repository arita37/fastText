FROM centos:7.2.1511

RUN yum update -y \
    && yum install -y gcc gcc-c++ make cmake openssl-devel bzip2-devel wget libffi-devel perl \
    && wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz -P /usr/src \
    && tar -xvf /usr/src/Python-3.7.0.tgz -C /usr/src/

WORKDIR /usr/src/Python-3.7.0
RUN ./configure --enable-optimizations \
    && make altinstall \
    && ln -s /usr/local/bin/python3.7 /usr/bin/python3.7 \
    && ln -s /usr/local/bin/pip3.7 /usr/bin/pip3.7 \
    && rm /usr/src/Python-3.7.0.tgz

WORKDIR /
