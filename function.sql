CREATE FUNCTION fn_vendas_funcionario (@id_funcionario INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        f.id AS id_funcionario,
        f.nome_completo,
        COUNT(a.id) AS total_vendas,
        SUM(a.valor_acordado) AS receita_total
    FROM funcionarios f
    INNER JOIN assinaturas a
        ON f.id = a.id_funcionario_venda
    WHERE f.id = @id_funcionario
    GROUP BY f.id, f.nome_completo
);
--puxando a função
SELECT *
FROM dbo.fn_vendas_funcionario(1);
