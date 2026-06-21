<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Novo Plano</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <a href="index.php" class="btn-voltar">⬅ Voltar para Listagem</a>

    <h2>➕ Cadastrar Novo Plano de Academia</h2>

    <div class="form-container">
        <form action="inserir.php" method="POST">
            
            <div class="form-group">
                <label for="nome">Nome do Plano:*</label>
                <input type="text" id="nome" name="nome" placeholder="Ex: Plano Mensal VIP" required maxlength="50">
            </div>

            <div class="form-group">
                <label for="descricao">Descrição:</label>
                <textarea id="descricao" name="descricao" rows="3" placeholder="Ex: Acesso livre a musculação" maxlength="255"></textarea>
            </div>

            <div class="form-group">
                <label for="valor_mensal">Valor Mensal (R$):*</label>
                <input type="number" id="valor_mensal" name="valor_mensal" step="0.01" placeholder="0.00" required>
            </div>

            <div class="form-group">
                <label for="taxa_adesao">Taxa de Adesão (R$):*</label>
                <input type="number" id="taxa_adesao" name="taxa_adesao" step="0.01" placeholder="0.00" required>
            </div>

            <div class="form-group">
                <label for="duracao_meses">Duração (Em Meses):*</label>
                <input type="number" id="duracao_meses" name="duracao_meses" min="1" max="120" placeholder="Ex: 12" required>
            </div>

            <div class="form-group">
                <label for="limite_acessos_diarios">Limite de Acessos Diários:*</label>
                <input type="number" id="limite_acessos_diarios" name="limite_acessos_diarios" min="1" max="10" placeholder="Ex: 1" required>
            </div>

            <div class="form-group">
                <label for="ativo">Status do Plano:*</label>
                <select id="ativo" name="ativo" required>
                    <option value="1">Ativo (Disponível)</option>
                    <option value="0">Inativo</option>
                </select>
            </div>

            <button type="submit" class="btn-salvar">Salvar Plano no Banco</button>
        </form>
    </div>

</body>
</html>