<!-- Script para conexão do PHP ao banco SQL SERVER. -->
 
<?php
$serverName = "localhost"; 
$database = "3gfit"; 
$uid = "3gfit";
$pwd = "3gfit";

try {
    $conn = new PDO("sqlsrv:server=$serverName;Database=$database", $uid, $pwd);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("Erro na conexão: " . $e->getMessage());
}
?>