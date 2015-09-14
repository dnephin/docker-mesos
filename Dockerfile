
FROM    debian:jessie
MAINTAINER Daniel Nephin <dnephin@gmail.com>

RUN     apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
        echo "deb http://repos.mesosphere.com/debian jessie main" > \
            /etc/apt/sources.list.d/mesosphere.list && \
        apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            mesos

RUN     mkdir /workdir
ENV     MESOS_LOG_DIR /var/log
ENTRYPOINT ["mesos"]
CMD     ["master", "--work_dir=/workdir"]
