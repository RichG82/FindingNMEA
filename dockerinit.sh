
# create placeholders where logs will live
mkdir /var/www/finding-nmea.local
mkdir /var/www/finding-nmea.local/log
mkdir /var/www/finding-nmea.local/public_html

# remove example files from the apache config
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


apt-get install -y python
apt-get install -y python-pip
pip install pynmea2
apt-get install python-mysqldb

#apt-get install -y python3-pip
#apt-get install python-pip
#apt-get install python-pip python-dev build-essential 

#python3 -m pip install pynmea2
#python -m pip install pynmea2
#pip install -y pynmea2
#pip install pynmea2


