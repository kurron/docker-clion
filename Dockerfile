FROM kurron/docker-azul-jdk-8-build:latest

MAINTAINER Ron Kurr <kurr@kurron.org>

ENV CL_JDK /usr/lib/jvm/zulu-8-amd64

ENTRYPOINT ["/opt/clion-2017.2/bin/clion.sh"]

USER root

# Install make and compilers
RUN apt-get update && \
    apt-get install -y build-essential autoconf automake && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ADD https://download.jetbrains.com/cpp/CLion-2017.2.tar.gz /opt

RUN rm -rf /opt/clion-2017.2/jre64

USER powerless

