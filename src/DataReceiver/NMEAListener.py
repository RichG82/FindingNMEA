import sys
import pynmea2
import time
import NmeaDAO

# gotta install pynmea2 first.
# Use command: sudo pip install pynmea2
# OR  python3 -m pip install pynmea2
# usage python3 NMEAListener.py < ../../dat/datalog3
# or python NMEAListener.py < ../../dat/datalog3

print ("Reading NMEA input file sent to stdin...")

validNmea = 0
allRec = 0
startTime = time.localtime()

for line in sys.stdin:
    cutline = line.lstrip('\\c:').strip()
    tokens = cutline.split('\\')
    timeTokens = tokens[0].split('*')

    # format time
    try :
        timeinMillis = int(timeTokens[0])
        # this appears to be a date in millisesonds form
        #ref :  https://www.timecalculator.net/milliseconds-to-date
        # python 'time' doesn't include support for millis OOTB
        # so the millis are converted to seconds and truncated the millis.
        timeObj = time.localtime(timeinMillis/ 1000)
        millisOnly = timeinMillis % 1000 # not used.  Needed?
        dateFormatted = time.strftime('%m-%d-%Y', timeObj)
        timeFormatted = time.strftime('%I:%M:%S', timeObj)
    except:
        print ('problem with parsing time for record ' + cutline)
        continue

    # This is like 61 of 6D or something...
    someStrangeSixHexTHing = timeTokens[1]

    # This is the nmea data we can parse
    nmeaStr = tokens[1]
    #print (nmeaStr)

    if not nmeaStr:
        print ('nmeaStr is NULL.   Skipping')
        continue
    allRec = allRec + 1
    try:
        nmeaObj = pynmea2.parse(nmeaStr)
        validNmea = validNmea + 1
    except:
        # print ('NMEA Data cannot be parsed.   Skipping')
        continue

    #  If we get here, the record is VALID
    NmeaDAO.save_nmea_object(timeObj, nmeaObj)
# END LOOP

print ('Total counts.  validNmea = ' + str(validNmea) + ' allRec = ' + str(allRec) + ' valid rate = ' + str(validNmea/allRec))
print ('Start time = ' + startTime + ' End Time = ' + time.localtime())
