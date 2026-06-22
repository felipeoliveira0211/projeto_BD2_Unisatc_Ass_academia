<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    require_once 'config/conexao.php';

    $id                      = (int) $_POST['id']; 
    $nome                    = $_POST['nome'];
    $descricao               = !empty($_POST['descricao']) ? $_POST['descricao'] : null;
    $valor_mensal            = $_POST['valor_mensal'];
    $taxa_adesao             = $_POST['taxa_adesao'];
    $duracao_meses           = (int) $_POST['duracao_meses'];
    $limite_acessos_diarios  = (int) $_POST['limite_acessos_diarios'];
    $ativo                   = (int) $_POST['ativo'];

    $sql = "UPDATE planos 
            SET nome = ?, 
                descricao = ?, 
                valor_mensal = ?, 
                taxa_adesao = ?, 
                duracao_meses = ?, 
                limite_acessos_diarios = ?, 
                ativo = ? 
            WHERE id = ?";

    $params = array(
        $nome,
        $descricao,
        $valor_mensal,
        $taxa_adesao,
        $duracao_meses,
        $limite_acessos_diarios,
        $ativo,
        $id
    );

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