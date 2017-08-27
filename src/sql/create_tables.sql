/*
  To run:
mysql -u feeder -p readings < create_tables.sql

*/

USE readings;

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
  /*  age_gps_data     == ''
     ref_station_id   == '0000'
     */
);


DROP TABLE IF EXISTS vtg_data;

CREATE TABLE vtg_data (
  record_time     DATETIME,
  true_track      DECIMAL(6,1),
  true_track_sym  varchar(1),
  mag_track       DECIMAL(6,1),
  mag_track_sym   varchar(1),
  spd_over_grnd_kts DECIMAL(6,1),
  spd_over_grnd_kts_sym varchar(1),
  spd_over_grnd_kmph DECIMAL(6,1),
  spd_over_grnd_kmph_sym varchar(1)
);





drop table if exists sentence_metadata

CREATE TABLE `sentence_metadata` (
  `id` int(11) NOT NULL,
  `sentence_type` varchar(45) DEFAULT NULL,
  `source_column` varchar(45) DEFAULT NULL,
  `data_column` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




drop table if exists nmea_data


CREATE TABLE `nmea_data` (
  `timestamp` datetime NOT NULL,
  `sentence_type` varchar(45) DEFAULT NULL,
  `column_01` varchar(100) DEFAULT NULL,
  `column_02` varchar(100) DEFAULT NULL,
  `column_03` varchar(100) DEFAULT NULL,
  `column_04` varchar(100) DEFAULT NULL,
  `column_05` varchar(100) DEFAULT NULL,
  `column_06` varchar(100) DEFAULT NULL,
  `column_07` varchar(100) DEFAULT NULL,
  `column_08` varchar(100) DEFAULT NULL,
  `column_09` varchar(100) DEFAULT NULL,
  `column_10` varchar(100) DEFAULT NULL,
  `column_11` varchar(100) DEFAULT NULL,
  `column_12` varchar(100) DEFAULT NULL,
  `column_13` varchar(100) DEFAULT NULL,
  `column_14` varchar(100) DEFAULT NULL,
  `column_15` varchar(100) DEFAULT NULL,
  `column_16` varchar(100) DEFAULT NULL,
  `column_17` varchar(100) DEFAULT NULL,
  `column_18` varchar(100) DEFAULT NULL,
  `column_19` varchar(100) DEFAULT NULL,
  `column_20` varchar(100) DEFAULT NULL,
  `column_21` varchar(100) DEFAULT NULL,
  `column_22` varchar(100) DEFAULT NULL,
  `column_23` varchar(100) DEFAULT NULL,
  `column_24` varchar(100) DEFAULT NULL,
  `column_25` varchar(100) DEFAULT NULL,
  `column_26` varchar(100) DEFAULT NULL,
  `column_27` varchar(100) DEFAULT NULL,
  `column_28` varchar(100) DEFAULT NULL,
  `column_29` varchar(100) DEFAULT NULL,
  `column_30` varchar(100) DEFAULT NULL,
  `column_31` varchar(100) DEFAULT NULL,
  `column_32` varchar(100) DEFAULT NULL,
  `column_33` varchar(100) DEFAULT NULL,
  `column_34` varchar(100) DEFAULT NULL,
  `column_35` varchar(100) DEFAULT NULL,
  `column_36` varchar(100) DEFAULT NULL,
  `column_37` varchar(100) DEFAULT NULL,
  `column_38` varchar(100) DEFAULT NULL,
  `column_39` varchar(100) DEFAULT NULL,
  `column_40` varchar(100) DEFAULT NULL,
  `column_41` varchar(100) DEFAULT NULL,
  `column_42` varchar(100) DEFAULT NULL,
  `column_43` varchar(100) DEFAULT NULL,
  `column_44` varchar(100) DEFAULT NULL,
  `column_45` varchar(100) DEFAULT NULL,
  `column_46` varchar(100) DEFAULT NULL,
  `column_47` varchar(100) DEFAULT NULL,
  `column_48` varchar(100) DEFAULT NULL,
  `column_49` varchar(100) DEFAULT NULL,
  `column_50` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
