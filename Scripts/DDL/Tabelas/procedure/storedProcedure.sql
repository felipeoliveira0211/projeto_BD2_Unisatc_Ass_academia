CREATE PROCEDURE sp_relatorio_frequencia_aluno
(
    @data_inicio DATE,
    @data_fim DATE,
    @id_aluno INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        a.id AS id_aluno,
        a.nome_completo,
        p.nome AS plano,
        COUNT(ac.id) AS total_acessos,
        MIN(ac.data_hora_entrada) AS primeiro_acesso_periodo,
        MAX(ac.data_hora_entrada) AS ultimo_acesso_periodo
    FROM alunos a
    INNER JOIN assinaturas ass
        ON ass.id_aluno = a.id
    INNER JOIN planos p
        ON p.id = ass.id_plano
    LEFT JOIN acessos_catraca ac
        ON ac.id_aluno = a.id
        AND CAST(ac.data_hora_entrada AS DATE) BETWEEN @data_inicio AND @data_fim
        AND ac.sentido_acesso = 'E'
    WHERE a.ativo = 1
      AND ass.status_assinatura = 'A'
      AND (@id_aluno IS NULL OR a.id = @id_aluno)
    GROUP BY
        a.id,
        a.nome_completo,
        p.nome
    ORDER BY total_acessos DESC;
END;
GO