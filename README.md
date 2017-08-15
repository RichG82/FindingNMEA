# FindingNMEA

I dont know markdown... so, sorry in advance.


### Source Docker Location
https://hub.docker.com/r/linode/lamp/

MySQL Password: Admin2015

### 1.  Clone the repository
git clone https://github.com/RichG82/FindingNMEA.git finding-nmea

### 2.  Install Docker
https://docs.docker.com/engine/installation/

### 3.  Create the Docker Image
docker build -t nmea .

### 4. Start the Docker Image
docker run -p 8080:80 -t -i nmea /bin/bash

(this will leave the bash shell open for you at the command prompt. SCORE!)




