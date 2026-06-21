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

    try {
        $sql = "UPDATE planos 
                SET nome = :nome, 
                    descricao = :descricao, 
                    valor_mensal = :valor_mensal, 
                    taxa_adesao = :taxa_adesao, 
                    duracao_meses = :duracao_meses, 
                    limite_acessos_diarios = :limite_acessos_diarios, 
                    ativo = :ativo 
                WHERE id = :id";
        
        $stmt = $conn->prepare($sql);

        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->bindParam(':nome', $nome);
        $stmt->bindParam(':descricao', $descricao);
        $stmt->bindParam(':valor_mensal', $valor_mensal);
        $stmt->bindParam(':taxa_adesao', $taxa_adesao);
        $stmt->bindParam(':duracao_meses', $duracao_meses, PDO::PARAM_INT);
        $stmt->bindParam(':limite_acessos_diarios', $limite_acessos_diarios, PDO::PARAM_INT);
        $stmt->bindParam(':ativo', $ativo, PDO::PARAM_INT);

        $stmt->execute();

        header("Location: index.php");
        exit();

    } catch (PDOException $e) {
        die("Erro ao atualizar o plano no banco de dados: " . $e->getMessage());
    }

} else {
    header("Location: index.php");
    exit();
}
?>