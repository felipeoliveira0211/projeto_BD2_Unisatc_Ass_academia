-- ============================================================
-- FUNCTION: fn_desempenho_funcionario
-- Retorna as vendas, cancelamentos e taxa de cancelamento
-- de um funcionário específico.
-- ============================================================

CREATE FUNCTION fn_desempenho_funcionario
(
    @id_funcionario INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        f.id                                        AS id_funcionario,
        f.nome_completo                             AS funcionario,
        c.nome                                      AS cargo,
        COUNT(ass.id)                               AS total_vendas,

        SUM(CASE 
                WHEN ass.status_assinatura = 'I' 
                THEN 1 ELSE 0 
            END)                                    AS vendas_canceladas,

        CAST(
            100.0 * SUM(CASE 
                            WHEN ass.status_assinatura = 'I' 
                            THEN 1 ELSE 0 
                        END)
            / COUNT(ass.id)
        AS DECIMAL(5,2))                            AS percentual_cancelamento,

        (
            SELECT COUNT(*)
            FROM assinaturas ass2
            WHERE ass2.id_funcionario_venda = f.id
              AND ass2.renovacao_automatica = 1
        )                                           AS vendas_com_renovacao_automatica

    FROM funcionarios f
    INNER JOIN cargos c
        ON c.id = f.id_cargo
    INNER JOIN assinaturas ass
        ON ass.id_funcionario_venda = f.id

    WHERE f.id = @id_funcionario

    GROUP BY
        f.id,
        f.nome_completo,
        c.nome
);

-- Consultar todos os funcionários usando CROSS APPLY
SELECT r.*
FROM funcionarios f
CROSS APPLY fn_desempenho_funcionario(f.id) r
ORDER BY r.total_vendas DESC;