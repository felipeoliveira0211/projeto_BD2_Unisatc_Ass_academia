<?php

$serverName = "DESKTOP-MD4L3DQ\\SQLEXPRESS";

$connectionOptions = [
    "Database" => "3gfit"
];

$conn = sqlsrv_connect($serverName, $connectionOptions);

if (!$conn) {
    die(print_r(sqlsrv_errors(), true));
}

?>