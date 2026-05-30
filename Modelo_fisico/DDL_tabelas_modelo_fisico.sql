CREATE TABLE "academias"(
    "id" INT NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "cnpj" CHAR(14) NOT NULL,
    "telefone" VARCHAR(15) NULL,
    "email" VARCHAR(100) NULL,
    "cep" CHAR(8) NOT NULL,
    "logradouro" VARCHAR(150) NOT NULL,
    "numero" VARCHAR(10) NOT NULL,
    "bairro" VARCHAR(50) NOT NULL,
    "cidade" VARCHAR(50) NOT NULL,
    "estado" CHAR(2) NOT NULL,
    "ativo" BIT NOT NULL DEFAULT 1
);
ALTER TABLE
    "academias" ADD CONSTRAINT "academias_id_primary" PRIMARY KEY("id");
CREATE UNIQUE INDEX "academias_cnpj_unique" ON
    "academias"("cnpj");
CREATE TABLE "planos"(
    "id" INT NOT NULL,
    "nome" VARCHAR(50) NOT NULL,
    "descricao" VARCHAR(255) NULL,
    "valor_mensal" DECIMAL(10, 2) NOT NULL,
    "taxa_adesao" DECIMAL(10, 2) NOT NULL,
    "duracao_meses" TINYINT NOT NULL,
    "permite_acesso_nacional" BIT NOT NULL,
    "limite_acessos_diarios" TINYINT NOT NULL DEFAULT 1,
    "ativo" BIT NOT NULL DEFAULT 1,
    "data_criacao" DATETIME NOT NULL DEFAULT GETDATE());
ALTER TABLE
    "planos" ADD CONSTRAINT "planos_id_primary" PRIMARY KEY("id");
CREATE TABLE "funcionarios"(
    "id" INT NOT NULL,
    "id_academia" INT NOT NULL,
    "nome_completo" VARCHAR(150) NOT NULL,
    "cpf" CHAR(11) NOT NULL,
    "cargo" VARCHAR(50) NOT NULL,
    "salario" DECIMAL(10, 2) NOT NULL,
    "data_contratacao" DATE NOT NULL,
    "cref" VARCHAR(15) NULL,
    "turno_trabalho" NVARCHAR(255) CHECK
        ("turno_trabalho" IN(N'1', N'2', N'3')) NOT NULL,
        "email_corporativo" VARCHAR(100) NULL,
        "ativo" BIT NOT NULL DEFAULT 1
);
ALTER TABLE
    "funcionarios" ADD CONSTRAINT "funcionarios_id_primary" PRIMARY KEY("id");
CREATE UNIQUE INDEX "funcionarios_cpf_unique" ON
    "funcionarios"("cpf");
CREATE TABLE "alunos"(
    "id" INT NOT NULL,
    "id_academia_registro" INT NOT NULL,
    "nome_completo" VARCHAR(150) NOT NULL,
    "cpf" CHAR(11) NOT NULL,
    "data_nascimento" DATE NOT NULL,
    "genero" NVARCHAR(255) CHECK
        ("genero" IN(N'M', N'F', N'O')) NOT NULL,
        "email" VARCHAR(100) NOT NULL,
        "telefone" VARCHAR(15) NOT NULL,
        "contato_emergencia_nome" VARCHAR(100) NOT NULL,
        "contato_emergencia_tel" VARCHAR(15) NOT NULL,
        "data_cadastro" DATETIME NOT NULL DEFAULT GETDATE());
ALTER TABLE
    "alunos" ADD CONSTRAINT "alunos_id_primary" PRIMARY KEY("id");
CREATE UNIQUE INDEX "alunos_cpf_unique" ON
    "alunos"("cpf");
CREATE TABLE "assinaturas"(
    "id" INT NOT NULL,
    "id_aluno" INT NOT NULL,
    "id_plano" INT NOT NULL,
    "id_funcionario_venda" INT NULL,
    "data_inicio" DATE NOT NULL,
    "data_fim" DATE NOT NULL,
    "status_assinatura" NVARCHAR(255) CHECK
        (
            "status_assinatura" IN(N'1', N'2', N'3')
        ) NOT NULL,
        "valor_acordado" DECIMAL(10, 2) NOT NULL,
        "dia_vencimento" TINYINT NOT NULL,
        "renovacao_automatica" BIT NOT NULL DEFAULT 1,
        "observacoes" VARCHAR(255) NULL
);
ALTER TABLE
    "assinaturas" ADD CONSTRAINT "assinaturas_id_primary" PRIMARY KEY("id");
CREATE TABLE "faturas_pagamento"(
    "id" INT NOT NULL,
    "id_assinatura" INT NOT NULL,
    "data_vencimento" DATE NOT NULL,
    "valor_fatura" DECIMAL(10, 2) NOT NULL,
    "valor_pago" DECIMAL(10, 2) NULL,
    "data_pagamento" DATETIME NULL,
    "metodo_pagamento" NVARCHAR(255) CHECK
        (
            "metodo_pagamento" IN(N'1', N'2', N'3', N'4')
        ) NULL,
        "status_pagamento" NVARCHAR(255)
    CHECK
        (
            "status_pagamento" IN(N'1', N'2', N'3')
        ) NOT NULL,
        "mes_referencia" TINYINT NOT NULL,
        "ano_referencia" SMALLINT NOT NULL,
        "multa_aplicada" DECIMAL(10, 2) NOT NULL
);
ALTER TABLE
    "faturas_pagamento" ADD CONSTRAINT "faturas_pagamento_id_primary" PRIMARY KEY("id");
CREATE TABLE "avaliacoes_fisicas"(
    "id" INT NOT NULL,
    "id_aluno" INT NOT NULL,
    "id_funcionario_avaliador" INT NOT NULL,
    "data_avaliacao" DATETIME NOT NULL DEFAULT GETDATE(), "idade_aluno" TINYINT NOT NULL, "peso_kg" DECIMAL(5, 2) NOT NULL, "altura_cm" TINYINT NOT NULL, "imc_calculado" DECIMAL(4, 2) NOT NULL, "circunferencia_braco_cm" DECIMAL(4, 1) NULL, "circunferencia_abdomen_cm" DECIMAL(4, 1) NULL, "observacoes_progresso" VARCHAR(500) NULL);
ALTER TABLE
    "avaliacoes_fisicas" ADD CONSTRAINT "avaliacoes_fisicas_id_primary" PRIMARY KEY("id");
CREATE TABLE "acessos_catraca"(
    "id" BIGINT NOT NULL,
    "id_aluno" INT NOT NULL,
    "id_academia" INT NOT NULL,
    "data_hora_entrada" DATETIME NOT NULL,
    "data_hora_saida" DATETIME NULL,
    "sentido_acesso" NVARCHAR(255) CHECK
        ("sentido_acesso" IN(N'E', N'S')) NOT NULL,
        "tipo_acesso" NVARCHAR(255)
    CHECK
        ("tipo_acesso" IN(N'1', N'2', N'3')) NOT NULL,
        "dispositivo_catraca_id" INT NOT NULL,
        "motivo_bloqueio" VARCHAR(100) NULL,
        "foi_liberacao_manual" BIT NOT NULL
);
ALTER TABLE
    "acessos_catraca" ADD CONSTRAINT "acessos_catraca_id_primary" PRIMARY KEY("id");
ALTER TABLE
    "assinaturas" ADD CONSTRAINT "assinaturas_id_plano_foreign" FOREIGN KEY("id_plano") REFERENCES "planos"("id");
ALTER TABLE
    "alunos" ADD CONSTRAINT "alunos_id_academia_registro_foreign" FOREIGN KEY("id_academia_registro") REFERENCES "academias"("id");
ALTER TABLE
    "faturas_pagamento" ADD CONSTRAINT "faturas_pagamento_id_assinatura_foreign" FOREIGN KEY("id_assinatura") REFERENCES "assinaturas"("id");
ALTER TABLE
    "assinaturas" ADD CONSTRAINT "assinaturas_id_funcionario_venda_foreign" FOREIGN KEY("id_funcionario_venda") REFERENCES "funcionarios"("id");
ALTER TABLE
    "acessos_catraca" ADD CONSTRAINT "acessos_catraca_id_academia_foreign" FOREIGN KEY("id_academia") REFERENCES "academias"("id");
ALTER TABLE
    "avaliacoes_fisicas" ADD CONSTRAINT "avaliacoes_fisicas_id_aluno_foreign" FOREIGN KEY("id_aluno") REFERENCES "alunos"("id");
ALTER TABLE
    "acessos_catraca" ADD CONSTRAINT "acessos_catraca_id_aluno_foreign" FOREIGN KEY("id_aluno") REFERENCES "alunos"("id");
ALTER TABLE
    "avaliacoes_fisicas" ADD CONSTRAINT "avaliacoes_fisicas_id_funcionario_avaliador_foreign" FOREIGN KEY("id_funcionario_avaliador") REFERENCES "funcionarios"("id");
ALTER TABLE
    "assinaturas" ADD CONSTRAINT "assinaturas_id_aluno_foreign" FOREIGN KEY("id_aluno") REFERENCES "alunos"("id");
ALTER TABLE
    "funcionarios" ADD CONSTRAINT "funcionarios_id_academia_foreign" FOREIGN KEY("id_academia") REFERENCES "academias"("id");