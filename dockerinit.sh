
# create placeholders where logs will live
mkdir /var/www/finding-nmea.local
mkdir /var/www/finding-nmea.local/log
mkdir /var/www/finding-nmea.local/public_html

# remove example files from the apache config
#rm /etc/apache2/sites-available/example.com.conf
#rm /etc/apache2/sites-enabled/example.com.conf
rm /etc/apache2/sites-enabled/000-default.conf

echo "***********************************"
echo "       Cloning Repository          "
echo "***********************************"


rm /finding-nmea -R
git clone https://github.com/RichG82/FindingNMEA.git finding-nmea


service apache2 start
service mysql start 
service ssh start

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

