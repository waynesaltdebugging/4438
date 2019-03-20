FROM debian:stretch

RUN apt-get update && apt-get install -y wget gnupg
RUN wget -O - https://repo.saltstack.com/apt/debian/9/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo "deb http://repo.saltstack.com/apt/debian/9/amd64/latest stretch main" > /etc/apt/sources.list.d/saltstack.list
RUN apt-get update && apt-get install -y salt-minion
RUN apt-get install -y vim-tiny
COPY minion /etc/salt/minion
COPY thing.sls /srv/salt/thing.sls
ENTRYPOINT ["tail", "-f", "/dev/null"]
