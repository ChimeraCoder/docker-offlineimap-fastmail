FROM debian:wheezy
MAINTAINER Aditya Mukerjee <dev@chimeracoder.net>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update --fix-missing
RUN apt-get install -y bash 
RUN apt-get install -y wget
RUN apt-get install -y -o Acquire::ForceIPv4=true offlineimap ca-certificates
RUN apt-get install -y -o Acquire::ForceIPv4=true vim


RUN useradd -m offlineimap
ADD offlineimaprc /home/offlineimap/.offlineimaprc
ADD run.sh /home/offlineimap/run.sh
RUN chmod 755 /home/offlineimap/run.sh

RUN chown offlineimap:offlineimap /home/offlineimap/.offlineimaprc

RUN chown -R offlineimap:users /home/offlineimap/

USER offlineimap


# Use exec mode so offlineimap can receive SIGUSR2
CMD ["/home/offlineimap/run.sh"]
