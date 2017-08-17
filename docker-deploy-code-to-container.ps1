
# get list of running containers
docker ps

$container_id = Read-Host "Enter container ID"

docker cp ./dockerinit.sh $container_id`:./dockerinit.sh
docker cp ./etc/apache2/sites-enabled/nmea.www.conf $container_id`:/etc/apache2/sites-available
docker cp ./etc/apache2/sites-enabled/nmea.www.conf $container_id`:/etc/apache2/sites-enabled
docker cp ./etc/mysql/my.cnf $container_id`:/etc/mysql

docker cp ./bower_components $container_id`:/var/www/finding-nmea.local/public_html/bower_components
docker cp ./src/html $container_id`:/var/www/finding-nmea.local/public_html
#docker exec 72b6b1485f2c "mv /var/www/finding-nmea.local/public_html/html/*.* /var/www/finding-nmea.local/public_html"


docker cp ./src/css $container_id`:/var/www/finding-nmea.local/public_html/css
docker cp ./src/js $container_id`:/var/www/finding-nmea.local/public_html/js

#COPY ./dockerinit.sh ./dockerinit.sh
#COPY ./etc/apache2/sites-enabled/nmea.www.conf /etc/apache2/sites-available
#COPY ./etc/apache2/sites-enabled/nmea.www.conf /etc/apache2/sites-enabled
#COPY ./etc/mysql/my.cnf /etc/mysql

# copy web files for the front end
#COPY ./bower_components /var/www/finding-nmea.local/public_html/bower_components
#COPY ./src/html /var/www/finding-nmea.local/public_html
#COPY ./src/css /var/www/finding-nmea.local/public_html/css
#COPY ./src/js /var/www/finding-nmea.local/public_html/js

