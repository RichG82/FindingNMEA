FROM linode/lamp
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
#RUN apt-get install dmsetup && dmsetup mknodes

#RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./dockerinit.sh ./dockerinit.sh

COPY ./bin/etc /etc
#COPY ./etc/apache2/sites-enabled/nmea.www.conf /etc/apache2/sites-available
#COPY ./etc/apache2/sites-enabled/nmea.www.conf /etc/apache2/sites-enabled
#COPY ./etc/mysql/my.cnf /etc/mysql


# copy web files for the front end
COPY ./bin/bower_components /var/www/finding-nmea.local/public_html/bower_components
COPY ./bin/data.php /var/www/finding-nmea.local/public_html
COPY ./bin/index.php /var/www/finding-nmea.local/public_html
COPY ./bin/test.php /var/www/finding-nmea.local/public_html

COPY ./bin/css /var/www/finding-nmea.local/public_html/css
COPY ./bin/js /var/www/finding-nmea.local/public_html/js

RUN apt-get update

# install git
RUN apt-get install -y git

# install Python 3 pip
##### RUN apt-get install -y python3-pip

# install Python 2
RUN apt-get install -y python
RUN apt-get install -y python-pip

# install python dependencies
RUN apt-get install -y python-mysqldb
RUN pip install pynmea2
#RUN python3 -m pip install pynmea2


# install x11 apps, so we can VLC into our machine (at some point)
#RUN apt-get install -qqy x11-apps
#ENV DISPLAY :0
#CMD xeyes

# expose MySQL Port
EXPOSE 3306

# expose Apache port
EXPOSE 80

ENTRYPOINT /dockerinit.sh && /bin/bash