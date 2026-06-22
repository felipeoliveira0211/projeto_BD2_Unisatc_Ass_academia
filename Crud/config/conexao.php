<?php
// ========== CONFIGURAÇÃO PARA SQL SERVER EXPRESS ==========

$serverName = "DESKTOP-MD4L3DQ\\SQLEXPRESS";  
$database = "3gfit";                           
$uid = "";                                      
$pwd = "";                                      

try {
    $conn = new PDO(
        "sqlsrv:server=$serverName;Database=$database;Trusted_Connection=yes",
        $uid, 
        $pwd
    );
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
} catch(PDOException $e) {
    die("❌ ERRO NA CONEXÃO: " . $e->getMessage());
}
?>