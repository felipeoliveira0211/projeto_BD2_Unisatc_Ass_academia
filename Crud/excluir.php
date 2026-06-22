<?php
if (isset($_GET['id']) && !empty($_GET['id'])) {

    require_once 'config/conexao.php';

    $id = (int) $_GET['id'];

    $sql = "DELETE FROM planos WHERE id = ?";

    $params = array($id);

    $stmt = sqlsrv_query($conn, $sql, $params);

    if ($stmt === false) {
        die(print_r(sqlsrv_errors(), true));
    }

    header("Location: index.php");
    exit();

} else {
    header("Location: index.php");
    exit();
}
?>