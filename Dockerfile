FROM ubuntu:16.04

USER root

# apt-get initialization stuff
RUN apt-get update 
RUN apt-get install -qy software-properties-common

# Install deluge
RUN add-apt-repository ppa:deluge-team/ppa && \
    apt-get update -q && \
    apt-get install -qy deluged deluge-web

# Install dropbox cli
RUN echo "deb [arch=i386,amd64] http://linux.dropbox.com/ubuntu xenial main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
RUN apt-key update && apt-get update
RUN apt-get install -y dropbox python-gpgme

# Install dropbox daemon
RUN apt-get install wget
RUN cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
RUN apt-get remove -y wget


#Exclude all but Media folder
#RUN cd /root/Dropbox
#RUN dropbox exclude add *
#RUN dropbox exclude remove Media

# Cleanup
#TODO del wget
#RUN apt-get -y autoremove; apt-get clean
#RUN rm -rf /tmp/* /var/tmp/* /var/cache/apt/archives/* /var/lib/apt/lists/*

EXPOSE 58846:58846
EXPOSE 53160:53160 
EXPOSE 8112:8112

RUN mkdir /root/deploy
ADD ./* /root/deploy/

RUN crontab /root/deploy/crontab

RUN chmod +x /root/deploy/*.sh





ENTRYPOINT ["/root/deploy/start.sh" ]