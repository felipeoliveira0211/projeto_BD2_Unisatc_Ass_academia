<?php
if (isset($_GET['id']) && !empty($_GET['id'])) {
    
    require_once 'config/conexao.php';
    
    $id = (int) $_GET['id'];

    try {
        $sql = "DELETE FROM planos WHERE id = :id";
        
        $stmt = $conn->prepare($sql);
        
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        
        $stmt->execute();
        
        header("Location: index.php");
        exit();

    } catch (PDOException $e) {
        die("Erro ao excluir o plano: O registro pode estar sendo usado por outra tabela. Detalhes: " . $e->getMessage());
    }

} else {
    header("Location: index.php");
    exit();
}
?>