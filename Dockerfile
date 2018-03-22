FROM ubuntu:latest

ENV INSTALLER_DIR_MININET mininet/util/install.sh
ENV REPOSITORY_DIR_MININET https://github.com/mininet/mininet.git

RUN apt-get update && apt-get install -y \
	git \
    tcpdump \
    sudo

RUN git clone $REPOSITORY_DIR_MININET \

    && chmod +x $INSTALLER_DIR_MININET \
    && ./$INSTALLER_DIR_MININET -fnv \

    && rm -rf /tmp/mininet \
    && rm -rf /tmp/openflow

EXPOSE 6653 6663

VOLUME /home/mininetdir
WORKDIR /home/mininetdir

CMD ["bash"]
