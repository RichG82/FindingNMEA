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

COPY ./bower_components /var/www/finding-nmea.local/public_html/bower_components
COPY ./src/css /var/www/finding-nmea.local/public_html/css
COPY ./src/js /var/www/finding-nmea.local/public_html/js

COPY ./src/html/data_gga.php /var/www/finding-nmea.local/public_html
COPY ./src/html/index.php /var/www/finding-nmea.local/public_html
COPY ./src/html/test.php /var/www/finding-nmea.local/public_html

#docker cp ./bower_components $container_id`:/var/www/finding-nmea.local/public_html/bower_components
#docker cp ./src/html/data_gga.php $container_id`:/var/www/finding-nmea.local/public_html
#docker cp ./src/html/index.php $container_id`:/var/www/finding-nmea.local/public_html
#docker cp ./src/html/test.php $container_id`:/var/www/finding-nmea.local/public_html




# expose SSH
EXPOSE 22

# expose MySQL Port
EXPOSE 3306

# expose Apache port
EXPOSE 80

ENTRYPOINT /dockerinit.sh && /bin/bash