FROM rgrenwick/finding-nmea


RUN apt-get install -y x11vnc xvfb firefox
RUN apt-get install -y php5-mysql
RUN service apache2 restart


# install x11 apps, so we can VLC into our machine (at some point)
RUN apt-get install -qqy x11-apps
ENV DISPLAY :0
CMD xeyes

EXPOSE 22
# expose MySQL Port
EXPOSE 3306

# expose Apache port
EXPOSE 80

ENTRYPOINT /dockerinit.sh && /bin/bash