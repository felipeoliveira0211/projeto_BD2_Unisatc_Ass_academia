<?php

$serverName = "DESKTOP-MD4L3DQ\\SQLEXPRESS";

$connectionOptions = [
    "Database" => "3gfit",
    "Trusted_Connection" => true
];

$conn = sqlsrv_connect($serverName, $connectionOptions);

if ($conn) {
    echo "Conectado com sucesso!";
} else {
    die(print_r(sqlsrv_errors(), true));
}