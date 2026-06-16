<?php
require_once 'config/conexao.php';

try {
    $query = "SELECT id, nome, descricao, valor_mensal, taxa_adesao, duracao_meses, limite_acessos_diarios, ativo FROM planos";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    $planos = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Erro ao buscar planos: " . $e->getMessage());
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Gerenciamento de Planos - Academia</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <h2>📋 Painel Administrativo: Planos de Assinatura</h2>
    <a href="cadastrar.php" class="btn-cadastrar">+ Cadastrar Novo Plano</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome do Plano</th>
                <th>Descrição</th>
                <th>Valor Mensal</th>
                <th>Taxa Adesão</th>
                <th>Duração</th>
                <th>Acessos/Dia</th>
                <th>Status</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php if (isset($planos) && count($planos) > 0): ?>
                <?php foreach ($planos as $plano): ?>
                <tr>
                    <td><strong>#<?php echo $plano['id']; ?></strong></td>
                    <td><?php echo htmlspecialchars($plano['nome']); ?></td>
                    <td><?php echo htmlspecialchars($plano['descricao']); ?></td>
                    <td>R$ <?php echo number_format($plano['valor_mensal'], 2, ',', '.'); ?></td>
                    <td>R$ <?php echo number_format($plano['taxa_adesao'], 2, ',', '.'); ?></td>
                    <td><?php echo $plano['duracao_meses']; ?> meses</td>
                    <td><?php echo $plano['limite_acessos_diarios']; ?></td>
                    <td>
                        <span class="<?php echo $plano['ativo'] ? 'status-ativo' : 'status-inativo'; ?>">
                            <?php echo $plano['ativo'] ? 'Ativo' : 'Inativo'; ?>
                        </span>
                    </td>
                    <td>
                        <a href="editar.php?id=<?php echo $plano['id']; ?>" class="btn-editar">Editar</a>
                        <a href="excluir.php?id=<?php echo $plano['id']; ?>" class="btn-excluir" onclick="return confirm('Deseja realmente remover o plano?')">Excluir</a>
                    </td>
                </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="9" style="text-align: center; color: #777; padding: 30px;">
                        Nenhum plano foi encontrado no banco de dados.
                    </td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</body>
</html>