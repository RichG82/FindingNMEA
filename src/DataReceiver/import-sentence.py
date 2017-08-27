#!/usr/bin/python

import MySQLdb
import time

db = MySQLdb.connect("localhost", "feeder", "password", "readings")
curs = db.cursor()


## fetch a list of the mapping
cursor = db.cursor();