
FROM    debian:jessie
MAINTAINER Daniel Nephin <dnephin@gmail.com>

COPY    install.sh /root/install.sh
RUN     /root/install.sh
RUN     wget -q -O- https://get.docker.com/ | sh
RUN     mkdir /workdir
ENV     MESOS_LOG_DIR /var/log
ENTRYPOINT ["dumb-init", "mesos"]
CMD     ["master", "--work_dir=/workdir"]
