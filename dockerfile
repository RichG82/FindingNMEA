FROM linode/lamp
# https://hub.docker.com/r/linode/lamp/
# MySQL Password: Admin2015
#---------------------------------------------------------------

## Step 1: Create the image
##   docker build -t nmea .

## Step 2: Start the container
##   docker run -p 8080:80 -t -i nmea /bin/bash

## connect to mysql
## mysql -u root -pAdmin2015

# to be able to ping your container
# docker run --rm -ti --privileged --network=none --pid=host justincormack/nsenter1 bin/sh -c "iptables -A FORWARD -j ACCEPT"
#-------------------------------------------------------------------
#RUN apt-get install dmsetup && dmsetup mknodes

#RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update
#RUN apt-get install git-all
RUN apt-get install -y git

# install x11 apps, so we can VLC into our machine (at some point)
RUN apt-get install -qqy x11-apps

# install pip - python package manager
RUN apt-get install -y python3-pip
RUN apt-get install -y python-mysqldb

#RUN apt-get install python-dev libmysqlclient-dev
#RUN apt-get install python3-dev

#RUN python3 -m pip install mysqlclient
RUN python3 -m pip install pynmea2

#RUN git clone https://github.com/RichG82/FindingNMEA.git finding-nmea

#ENV DISPLAY :0
#CMD xeyes

EXPOSE 3306
EXPOSE 80

COPY ./dockerinit.sh ./dockerinit.sh
COPY ./nmea.www.conf /etc/apache2/sites-available

ENTRYPOINT /dockerinit.sh && /bin/bash