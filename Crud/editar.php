<?php
if (isset($_GET['id']) && !empty($_GET['id'])) {
    
    require_once 'config/conexao.php';
    $id = (int) $_GET['id'];

    try {
        $sql = "SELECT id, nome, descricao, valor_mensal, taxa_adesao, duracao_meses, limite_acessos_diarios, ativo FROM planos WHERE id = :id";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        
        $plano = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$plano) {
            header("Location: index.php");
            exit();
        }

    } catch (PDOException $e) {
        die("Erro ao buscar dados do plano: " . $e->getMessage());
    }

} else {
    header("Location: index.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Editar Plano</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <a href="index.php" class="btn-voltar">⬅ Voltar para Listagem</a>

    <h2>✏️ Editar Plano de Academia</h2>

    <div class="form-container">
        <form action="atualizar.php" method="POST">
            
            <input type="hidden" name="id" value="<?php echo $plano['id']; ?>">
            
            <div class="form-group">
                <label for="nome">Nome do Plano:*</label>
                <input type="text" id="nome" name="nome" value="<?php echo htmlspecialchars($plano['nome']); ?>" required maxlength="50">
            </div>

            <div class="form-group">
                <label for="descricao">Descrição:</label>
                <textarea id="descricao" name="descricao" rows="3" maxlength="255"><?php echo htmlspecialchars($plano['descricao']); ?></textarea>
            </div>

            <div class="form-group">
                <label for="valor_mensal">Valor Mensal (R$):*</label>
                <input type="number" id="valor_mensal" name="valor_mensal" step="0.01" value="<?php echo $plano['valor_mensal']; ?>" required>
            </div>

            <div class="form-group">
                <label for="taxa_adesao">Taxa de Adesão (R$):*</label>
                <input type="number" id="taxa_adesao" name="taxa_adesao" step="0.01" value="<?php echo $plano['taxa_adesao']; ?>" required>
            </div>

            <div class="form-group">
                <label for="duracao_meses">Duração (Em Meses):*</label>
                <input type="number" id="duracao_meses" name="duracao_meses" min="1" max="120" value="<?php echo $plano['duracao_meses']; ?>" required>
            </div>

            <div class="form-group">
                <label for="limite_acessos_diarios">Limite de Acessos Diários:*</label>
                <input type="number" id="limite_acessos_diarios" name="limite_acessos_diarios" min="1" max="10" value="<?php echo $plano['limite_acessos_diarios']; ?>" required>
            </div>

            <div class="form-group">
                <label for="ativo">Status do Plano:*</label>
                <select id="ativo" name="ativo" required>
                    <option value="1" <?php echo $plano['ativo'] == 1 ? 'selected' : ''; ?>>Ativo (Disponível)</option>
                    <option value="0" <?php echo $plano['ativo'] == 0 ? 'selected' : ''; ?>>Inativo</option>
                </select>
            </div>

            <button type="submit" class="btn-salvar">Atualizar Plano</button>
        </form>
    </div>

</body>
</html>