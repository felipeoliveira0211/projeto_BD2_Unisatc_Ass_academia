--índice pergunta 1
CREATE NONCLUSTERED INDEX IX_assinaturas_funcionario_status_renovacao
ON assinaturas (
    id_funcionario_venda,
    status_assinatura,
    renovacao_automatica
);
--índice pergunta 2
CREATE NONCLUSTERED INDEX IX_faturas_assinatura_status
ON faturas_pagamento (
    id_assinatura,
    status_pagamento
);
--índice pergunta 3
CREATE NONCLUSTERED INDEX IX_acessos_aluno_data_tipo
ON acessos_catraca (
    id_aluno,
    data_hora_entrada,
    sentido_acesso,
    tipo_acesso
);
--índice pergunta 4
CREATE INDEX IX_faturas_pagamento_status_vencimento_assinatura
ON faturas_pagamento (
    status_pagamento,
    data_vencimento,
    id_assinatura
)
INCLUDE (
    valor_fatura,
    multa_aplicada
);
CREATE INDEX IX_assinaturas_status_aluno_plano
ON assinaturas (
    status_assinatura,
    id_aluno,
    id_plano
)
INCLUDE (
    id
);


CREATE INDEX IX_alunos_ativo_id
ON alunos (
    ativo,
    id
)
INCLUDE (
    nome_completo,
    data_nascimento
);

CREATE INDEX IX_acessos_catraca_sentido_datahora
ON acessos_catraca (
    sentido_acesso,
    data_hora_entrada
)
INCLUDE (
    tipo_acesso
);
--índice pergunta 6
CREATE INDEX IX_avaliacoes_fisicas_aluno_data
ON avaliacoes_fisicas (
    id_aluno,
    data_avaliacao
)
INCLUDE (
    peso_kg,
    percentual_gordura,
    massa_magra
);


CREATE INDEX IX_alunos_id_nome
ON alunos (
    id
)
INCLUDE (
    nome_completo
);

