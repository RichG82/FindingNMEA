FROM rgrenwick/raspberry-docker

# https://hub.docker.com/r/linode/lamp/
# MySQL Password: Admin2015
#---------------------------------------------------------------

## Step 1: Create the image
##   docker build -t nmea . 

## Step 2: Start the container
##   docker run -p 80:80 -p 3306:3306 -t -i nmea /bin/bash

## connect to mysql
## mysql -u root -pAdmin2015

#-------------------------------------------------------------------

#RUN service apache2 start
#RUN service mysql start
#RUN service ssh start


COPY ./dockerinit.sh ./dockerinit.sh
COPY ./bin/etc /etc

# expose SSH
EXPOSE 22

# expose MySQL Port
EXPOSE 3306

# expose Apache port
EXPOSE 80

ENTRYPOINT /dockerinit.sh && /bin/bash