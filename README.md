# FindingNMEA

I dont know markdown... so, sorry in advance.


### Source Docker Location
https://hub.docker.com/r/linode/lamp/

This was installed with a basic LAMP stack. 

MySQL Password: Admin2015

### 1.  Clone the repository
```git clone https://github.com/RichG82/FindingNMEA.git finding-nmea```

### 1a. Get  bower / npm packages
``` npm install ```
``` bower install ```

### 2.  Install Docker
https://docs.docker.com/engine/installation/


### 3.  Create the Docker Image
```docker build -t nmea .```

This will create a docker image and put it into the images repository.  To view all installed docker images, type:

```docker images```

### 4. Start the Docker Image
```docker run -p 8080:80 -t -i nmea /bin/bash```

This will spin up a new instance of a docker image and leave the shell open connected to the container.  Here are some common container commands:

List Containers: ```docker ps```

Kill Container: ```docker kill <containerid>```
  
Attach to Container (like SSH): ```docker attach <containerid>```

### 5. Misc Notes About the NMEA Image
- the /finding-nmea directory is created as part of the image.  This is where the main application will live
- Apache is not yet configured




