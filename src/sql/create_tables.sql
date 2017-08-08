/*
  To run:
  mysql -u feeder -p readings < create_tables.sql

*/

DROP TABLE IF EXISTS gga_data;

CREATE TABLE gga_data (
  record_time   DATETIME,
  lat DECIMAL(8,3),
  lat_dir varchar(1),
  lon DECIMAL(8,3),
  lon_dir varchar(1),
  gps_qual INTEGER(1),
  num_sats  varchar(5),
  horizontal_dil varchar(5),
  altitude       DECIMAL(6,2),
  altitude_units  varchar(1),
  geo_sep          varchar(5),
  geo_sep_units    varchar(1)
--  age_gps_data     == ''
  --ref_station_id   == '0000'
);
