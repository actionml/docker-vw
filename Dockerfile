FROM stackfeed/alpine:3.8-glibc

ARG version
LABEL com.actionml.vw.vendor=ActionML \
      com.actionml.vw.version=$version \
      com.actionml.vw.flavour=jni

ENV VW_GITURL=https://github.com/JohnLangford/vowpal_wabbit \
    VW_GITREV=$version

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/jre
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin


## Install Java alpine package the way official OpenJDK container image does.
#

# add a simple script that can auto-detect the appropriate JAVA_HOME value
# based on whether the JDK or only the JRE is installed
RUN { \
    echo '#!/bin/sh'; \
    echo 'set -e'; \
    echo; \
    echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
  } > /usr/local/bin/docker-java-home \
  && chmod +x /usr/local/bin/docker-java-home


## Install OpenJDK8 java runtime
#
RUN set -x && apk add --update --no-cache openjdk8-jre && \
      [ "$JAVA_HOME" = "$(docker-java-home)" ]


## Build and install VW (Vowpal Wabbit) library with JNI wrapper
#
RUN apk add --no-cache --update zlib boost && \
    apk add --no-cache --virtual=.deps zlib-dev boost-dev clang git build-base perl && \
    cd /tmp && \
    git clone $VW_GITURL vw && cd vw && git checkout $VW_GITREV && \
    make java && cp -r java/target ${JAVA_HOME}/../lib/amd64/jni && \
    rm -rf /tmp/* && \
    apk del .deps
