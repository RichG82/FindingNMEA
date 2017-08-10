
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
# password is 'password'
# mysql> USE readings;
# mysql> CREATE TABLE positions (lat NUMERIC, lon NUMERIC, formattedtime TEXT, timeasmillis NUMERIC);


#!/usr/bin/env python

import MySQLdb
import time

db = MySQLdb.connect("localhost", "feeder", "password", "readings")
curs=db.cursor()

commit_threshold = 20
commit_rows = 0

# only commits every X rows where X is the commit_threshold global
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
            print ("ERROR: in committing batch.  Data batch is lost and database is being rolled back for next set.")
            db.rollback()


# calls specific method below according to type and then lazy_commit()
def save_nmea_object(rec_time, nmeaObj) :
    try:
        if (nmeaObj.sentence_type == 'GGA'):
            save_gga(rec_time, nmeaObj)
        if (nmeaObj.sentence_type == 'VTG'):
            save_vtg(rec_time, nmeaObj)
    except:
        print ("Error with cursor: continuing...")

def save_gga(rec_time, nmeaObj):
    global curs
    #print ("Adding row of GGA data")
    insertString = """INSERT INTO gga_data(lat,lat_dir,lon,lon_dir, gps_qual,num_sats, horizontal_dil, altitude, altitude_units, geo_sep, geo_sep_units) values ("""
#    insertString += str(rec_time) + ','
    insertString += str(nmeaObj.lat) + ','
    insertString += "'" + str(nmeaObj.lat_dir) + "'" + ','
    insertString += str(nmeaObj.lon) + ','
    insertString += "'" + str(nmeaObj.lon_dir) + "'" + ','
    insertString += str(nmeaObj.gps_qual) + ','
    insertString += "'" + str(nmeaObj.num_sats) + "'" + ','
    insertString += "'" + str(nmeaObj.horizontal_dil) + "'" + ','
    insertString += str(nmeaObj.altitude) + ',';
    insertString += "'" + str(nmeaObj.altitude_units) + "'" + ','
    insertString += "'" + str(nmeaObj.geo_sep) + "'" + ','
    insertString += "'" + str(nmeaObj.geo_sep_units) + "'"
    insertString += ')'
    # print ('insertString - ' + insertString)
    curs.execute(insertString)
    lazy_commit()

def save_vtg(rec_time, nmeaObj):
    global curs
    # print ("Adding row of VTG data")
#    curs.execute ("""INSERT INTO vtg_data(record_time, true_track, true_track_sym, mag_track, mag_track_sym, spd_over_grnd_kts, spd_over_grnd_kts_sym, spd_over_grnd_kmph, spd_over_grnd_kmph_sym) values (rec_time, meaObj.true_track, meaObj.true_track_sym, meaObj.mag_track, meaObj.mag_track_sym, meaObj.spd_over_grnd_kts, meaObj.spd_over_grnd_kts_sym, meaObj.spd_over_grnd_kmph, meaObj.spd_over_grnd_kmph_sym)""")


#  https://stackoverflow.com/questions/1448429/how-to-install-mysqldb-python-data-access-library-to-mysql-on-mac-os-x#1448476

# Connector comparison
# https://stackoverflow.com/questions/4960048/python-3-and-mysql
# Fastest
# https://pypi.python.org/pypi/mysqlclient
# Gotta do this first:
# brew install mysql-connector-c
# python3 -m pip install pystan
# python3 -m pip install mysqlclient
