
# create placeholders where logs will live
mkdir /var/www/finding-nmea.local
mkdir /var/www/finding-nmea.local/log
mkdir /var/www/finding-nmea.local/public_html

rm /etc/apache2/sites-available/example.com.conf
rm /etc/apache2/sites-enabled/example.com.conf

echo "***********************************"
echo "       Cloning Repository          "
echo "***********************************"


git clone https://github.com/RichG82/FindingNMEA.git finding-nmea


service apache2 start
service mysql start 

echo "***********************************"
echo "          Services Started"
echo "***********************************"


mysql -u root -pAdmin2015 < /finding-nmea/src/sql/init_database.sql
mysql -u root -pAdmin2015 < /finding-nmea/src/sql/create_tables.sql

echo "***********************************"
echo "      Database/Tables Created"
echo "                                                  "
echo "To Connect:      mysql -u root -pAdmin2015       "
echo "***********************************"





# mysql> CREATE DATABASE readings;
# mysql> USE readings;
# mysql> CREATE USER 'feeder'@'localhost' IDENTIFIED BY 'password';
# mysql> GRANT ALL PRIVILEGES ON readings.* TO 'feeder'@'localhost';
# mysql> FLUSH PRIVILEGES;
# mysql> quit

# now login as that user    :   mysql -u feeder -p
# password is 'password'
# mysql> USE readings;
# mysql> CREATE TABLE positions (lat NUMERIC, lon NUMERIC, formattedtime TEXT, timeasmillis NUMERIC);