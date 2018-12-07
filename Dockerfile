FROM openjdk:8-jdk-alpine3.8

ARG version
LABEL com.actionml.harness-ciruntime.vendor=ActionML \
      com.actionml.harness-ciruntime.version=$version

RUN \
# install alpine essential packages and build-tools
    apk add --no-cache --update curl bash git tar \
        binutils coreutils findutils file build-base && \
# install python3 (from package)
    apk add --no-cache --update python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
        ln -sf /usr/bin/python3 /usr/bin/python && \
        ln -sf /usr/bin/python3-config /usr/bin/python-config && \
        ln -sf /usr/bin/pydoc3 /usr/bin/pydoc && \
        ln -sf /usr/bin/pip3 /usr/bin/pip && \
    rm -r /root/.cache
