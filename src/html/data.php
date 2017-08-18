<?php


$link = mysqli_connect("localhost", "root", "Admin2015", "readings");
$result = mysqli_query($link, "SELECT * FROM gga_data");

header('content-type: application/json');
while($row = mysqli_fetch_assoc($result)) {
    echo json_encode($row);
}


?>



