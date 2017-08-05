import sys
import pynmea2
import time

# gotta install pynmea2 first.
# Use command: sudo pip install pynmea2
# OR  python3 -m pip install pynmea2
# usage python3 NMEAListener.py < ../../dat/datalog3

print ("Reading NMEA input file sent to stdin...")

i = 0
for line in sys.stdin:
    line = line.lstrip('\\c:').strip()
    tokens = line.split('\\')
    timeTokens = tokens[0].split('*')

    # this appears to be a date in millisesonds form
    #ref :  https://www.timecalculator.net/milliseconds-to-date
    timeinMillis = int(timeTokens[0])

    # python 'time' doesn't include support for millis OOTB
    # so I converted it to seconds and saved off the millis. Do we need them?
    timeObj = time.localtime(timeinMillis/ 1000)
    millisOnly = timeinMillis % 1000

    dateFormatted = time.strftime('%m-%d-%Y', timeObj)
    timeFormatted = time.strftime('%I:%M:%S', timeObj)


    # This is like 61 of 6D or something...
    someStrangeSixHexTHing = timeTokens[1]

    # This is the nmea data we can parse
    nmeaStr = tokens[1]
    #print (nmeaStr)

    if not nmeaStr:
        print ('nmeaStr is NULL.   Skipping')
        continue
    try:
        nmeaObj = pynmea2.parse(nmeaStr)
    except:
        print ('nmeaStr is INVALID.   Skipping')
        continue

    if (nmeaObj.sentence_type == 'GGA'):
        i = i + 1
        print ('record from timstamp ' + dateFormatted + ' ' + timeFormatted + ':' + str(millisOnly))
        print ('nmea data: ' + str(nmeaObj))
        print ('lat  : ' + nmeaObj.lat)
        print ('long : ' + nmeaObj.lon)
        print ()

    # just output 5 lines and then stop for now.
    if i > 5 :
        break;
