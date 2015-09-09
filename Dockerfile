FROM ubuntu:14.04
MAINTAINER Indranath Chunder "indranath@yahoo.com"

ENV OPENGROK_INSTANCE_BASE /grok

RUN apt-get update
RUN apt-get install -y openjdk-7-jre-headless && \
    apt-get install -y exuberant-ctags && \
    apt-get install -y git && \
    apt-get install -y tomcat7 && \
    apt-get install -y wget && \
    apt-get install -y inotify-tools
ADD install.sh /usr/local/bin/install
RUN /usr/local/bin/install
ADD run.sh /usr/local/bin/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/local/bin/run"]

EXPOSE 8080
