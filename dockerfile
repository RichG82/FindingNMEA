FROM linode/lamp
# https://hub.docker.com/r/linode/lamp/
# MySQL Password: Admin2015
#---------------------------------------------------------------

## Step 1: Create the image
##   docker build -t nmea .

## Step 2: Start the container
##   docker run -p 8080:80 -t -i nmea /bin/bash

#-------------------------------------------------------------------
#RUN apt-get install dmsetup && dmsetup mknodes

#RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update
#RUN apt-get install git-all
RUN apt-get install -y git
RUN apt-get install -qqy x11-apps


RUN service apache2 start
RUN service mysql start

RUN mkdir nmea-app
RUN git clone https://github.com/RichG82/FindingNMEA.git finding-nmea

#ENV DISPLAY :0
#CMD xeyes

EXPOSE 3306
EXPOSE 80
