
#!/usr/bin/python
# Using Example

# sudo apt-get update
# apt-get update downloads the package lists from the repositories and "updates"
# them to get information on the newest versions of packages and their dependencies.

# sudo apt-get dist-upgrade
# will fetch new versions of packages existing on the machine if APT knows about
# these new versions by way of apt-get update lus it will also intelligently
# handle the dependencies, so it might remove obsolete packages or add new ones.

# Installing mysql using this link
# http://raspberrywebserver.com/sql-databases/using-mysql-on-a-raspberry-pi.html
# sudo apt-get install mysql-server python-mysqldb

# Mysql creds for fishbowl  :   root / nemo
# To login                  :   mysql -u root -p

# mysql> CREATE DATABASE readings;
# mysql> USE readings;
# mysql> CREATE USER 'feeder'@'localhost' IDENTIFIED BY 'password';
# mysql> GRANT ALL PRIVILEGES ON readings.* TO 'feeder'@'localhost';
# mysql> FLUSH PRIVILEGES;
# mysql> quit

# now login as that user    :   mysql -u feeder -p
# mysql> USE readings;
# mysql> CREATE TABLE positions (lat NUMERIC, lon NUMERIC, formattedtime TEXT, timeasmillis NUMERIC);


#!/usr/bin/env python

import MySQLdb

db = MySQLdb.connect("localhost", "feeder", "password", "readings")
curs=db.cursor()

commit_threshold = 100
commit_rows = 0

def lazy_commit() :
    global commit_threshold
    global commit_rows
    global db
    commit_rows = commit_rows + 1
    if (commit_rows >= commit_threshold) :
        try:
            db.commit()
            print ("Data committed")
            commit_rows = 0;
        except:
            print ("Error: the database is being rolled back")
            db.rollback()


def save_nmea_object(nmeaObj) :
    print ('SAVING nmea data: ' + str(nmeaObj))

# main
#try:
#$    curs.execute ("""INSERT INTO positions values(40,30,'hello',21.7)""")
    # db.commit()

#    print ("Data committed"

#except:
#    print "Error: the database is being rolled back"
#    db.rollback()



#  https://stackoverflow.com/questions/1448429/how-to-install-mysqldb-python-data-access-library-to-mysql-on-mac-os-x#1448476

# Connector comparison
# https://stackoverflow.com/questions/4960048/python-3-and-mysql
# Fastest
# https://pypi.python.org/pypi/mysqlclient
# Gotta do this first:
# brew install mysql-connector-c
# python3 -m pip install pystan
# python3 -m pip install mysqlclient
