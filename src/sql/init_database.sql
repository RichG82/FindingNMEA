 CREATE DATABASE readings;
 USE readings;
 CREATE USER 'feeder'@'localhost' IDENTIFIED BY 'password';
 GRANT ALL PRIVILEGES ON readings.* TO 'feeder'@'localhost';
 FLUSH PRIVILEGES;