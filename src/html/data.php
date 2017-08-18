<?php

//echo "test";

$link = mysqli_connect("localhost", "root", "Admin2015", "readings");
$result = mysqli_query($link, "SELECT * FROM gga_data limit 1000;");

//$x = mysqli_fetch_assoc($result);

//echo $result

header('content-type: application/json');
//echo json_encode($row);

//echo "Starting loop";
//if (mysqli_num_rows($result) > 0) {
    // output data of each row
   $data = array();
    while($row = mysqli_fetch_assoc($result)) {
        array_push($data,  array(
            'record_time' => $row["record_time"], 
            'lat' => $row["lat"],
            'lat_dir'=> $row["lat_dir"],
            'lon'=> $row["lon"],
            'lon_dir'=> $row["lon_dir"],
            'gps_qual'=> $row["gps_qual"],
            'num_status'=> $row["num_status"],
            'horizontal_dil'=> $row["horizontal_dil"],
            'altitude'=> $row["altitude"],
            'altitude_units'=> $row["altitude_units"],
            'geo_sep'=> $row["geo_sep"],
            'geo_sep_units'=> $row["geo_sep_units"],
        ));



//	echo json_encode($foo);
        //echo json_encode($row);
    }

echo json_encode($data);

//} else {
//    echo "0 results";
//}



 ?>



