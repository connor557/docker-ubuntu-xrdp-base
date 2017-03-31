FROM phusion/baseimage:0.9.16

MAINTAINER cobrien@connorcrew.us.to

RUN apt-get update && apt-get install --yes --force-yes --no-install-recommends xorg && apt-get clean && rm -rf /var/lig/apt/lists/* /tmp/* /var/tmp/*

# install compiled debs for xrdp
ADD x11rdp_0.9.0+master-1_amd64.deb /x11rdp.deb
ADD xrdp_0.9.0+master-1_amd64.deb /xrdp.deb
RUN dpkg -i *.deb
RUN rm *.deb

# install service file for xrdp
RUN mkdir /etc/service/xrdp
ADD xrdp.sh /etc/service/xrdp/run

# install service file for xrdp-sesman
RUN mkdir /etc/service/xrdp-sesman
ADD xrdp-sesman.sh /etc/service/xrdp-sesman/run

EXPOSE 3389

CMD ["/sbin/my_init"]
