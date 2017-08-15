 CREATE DATABASE readings;
 USE readings;
 CREATE USER 'feeder'@'localhost' IDENTIFIED BY 'password';
 #GRANT ALL PRIVILEGES ON readings.* TO 'feeder'@'localhost';
 GRANT ALL PRIVILEGES on readings.* to root@'%';
 GRANT ALL PRIVILEGES on readings.* to 'feeder'@'%';
 SET PASSWORD FOR root@'%' = PASSWORD('Admin2015');

 FLUSH PRIVILEGES;