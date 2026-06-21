<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    require_once 'config/conexao.php';

    $nome                    = $_POST['nome'];
    $descricao               = !empty($_POST['descricao']) ? $_POST['descricao'] : null;
    $valor_mensal            = $_POST['valor_mensal'];
    $taxa_adesao             = $_POST['taxa_adesao'];
    $duracao_meses           = $_POST['duracao_meses'];
    $limite_acessos_diarios  = $_POST['limite_acessos_diarios'];
    $ativo                   = $_POST['ativo'];
    $data_criacao            = date('Y-m-d H:i:s'); // Captura o momento exato do cadastro

    try {
        $sql = "INSERT INTO planos (nome, descricao, valor_mensal, taxa_adesao, duracao_meses, limite_acessos_diarios, ativo, data_criacao) 
                VALUES (:nome, :descricao, :valor_mensal, :taxa_adesao, :duracao_meses, :limite_acessos_diarios, :ativo, :data_criacao)";
        
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':descricao', $descricao);
        $stmt->bindParam(':valor_mensal', $valor_mensal);
        $stmt->bindParam(':taxa_adesao', $taxa_adesao);
        $stmt->bindParam(':duracao_meses', $duracao_meses, PDO::PARAM_INT);
        $stmt->bindParam(':limite_acessos_diarios', $limite_acessos_diarios, PDO::PARAM_INT);
        $stmt->bindParam(':ativo', $ativo, PDO::PARAM_INT);
        $stmt->bindParam(':data_criacao', $data_criacao);

        $stmt->execute();

        header("Location: index.php");
        exit();

    } catch (PDOException $e) {
        die("Erro ao salvar o plano no banco de dados: " . $e->getMessage());
    }

} else {
    header("Location: cadastrar.php");
    exit();
}
?>