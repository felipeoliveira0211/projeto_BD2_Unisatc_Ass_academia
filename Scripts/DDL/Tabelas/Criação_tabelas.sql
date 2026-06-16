/* TABELAS AUXILIARES */

CREATE TABLE cargos (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(200)
);

CREATE TABLE metodos_pagamento (
    id INT IDENTITY(1,1) PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE motivos_cancelamento (
    id INT IDENTITY(1,1) PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL UNIQUE
);


/* DISPOSITIVOS DE CATRACA */

CREATE TABLE dispositivos_catraca (
    id INT IDENTITY(1,1) PRIMARY KEY,

    nome_dispositivo VARCHAR(100) NOT NULL,

    localizacao VARCHAR(100),

    fabricante VARCHAR(100),

    modelo VARCHAR(100),

    ativo BIT NOT NULL DEFAULT 1
);


/* PLANOS */

CREATE TABLE planos (
    id INT IDENTITY(1,1) PRIMARY KEY,

    nome VARCHAR(50) NOT NULL,

    descricao VARCHAR(255),

    valor_mensal DECIMAL(10,2) NOT NULL,

    taxa_adesao DECIMAL(10,2) NOT NULL DEFAULT 0,

    duracao_meses TINYINT NOT NULL,

    limite_acessos_diarios TINYINT NULL,

    ativo BIT NOT NULL DEFAULT 1,

    data_criacao DATETIME NOT NULL DEFAULT GETDATE()
);


/* FUNCIONÁRIOS */

CREATE TABLE funcionarios (
    id INT IDENTITY(1,1) PRIMARY KEY,

    nome_completo VARCHAR(150) NOT NULL,

    cpf CHAR(11) NOT NULL UNIQUE,

    id_cargo INT NOT NULL,

    salario DECIMAL(10,2),

    data_contratacao DATE NOT NULL,

    turno_trabalho CHAR(1) NOT NULL,

    email_corporativo VARCHAR(150) UNIQUE,

    telefone VARCHAR(15),

    nome_conselho VARCHAR(50) NULL,

    numero_conselho VARCHAR(30) NULL,

    uf_conselho CHAR(2) NULL,

    ativo BIT NOT NULL DEFAULT 1,

    CONSTRAINT FK_FUNCIONARIO_CARGO
        FOREIGN KEY (id_cargo)
        REFERENCES cargos(id),

    CONSTRAINT CK_FUNCIONARIO_TURNO
        CHECK (turno_trabalho IN ('D','N'))

    -- D = Diurno
    -- N = Noturno
);


/* ALUNOS */

CREATE TABLE alunos (
    id INT IDENTITY(1,1) PRIMARY KEY,

    nome_completo VARCHAR(150) NOT NULL,

    cpf CHAR(11) NOT NULL UNIQUE,

    data_nascimento DATE NOT NULL,

    genero CHAR(1) NOT NULL,

    email VARCHAR(100) UNIQUE,

    telefone VARCHAR(15),

    contato_emergencia_nome VARCHAR(150),

    contato_emergencia_telefone VARCHAR(15),

    data_cadastro DATETIME NOT NULL DEFAULT GETDATE(),

    ativo BIT NOT NULL DEFAULT 1,

    CONSTRAINT CK_ALUNO_GENERO
        CHECK (genero IN ('M','F'))

    -- M = Masculino
    -- F = Feminino
);


/* ASSINATURAS */

CREATE TABLE assinaturas (
    id INT IDENTITY(1,1) PRIMARY KEY,

    id_aluno INT NOT NULL,

    id_plano INT NOT NULL,

    id_funcionario_venda INT NULL,

    data_inicio DATE NOT NULL,

    data_fim DATE NULL,

    status_assinatura CHAR(1) NOT NULL,

    valor_acordado DECIMAL(10,2) NOT NULL,

    dia_vencimento TINYINT NOT NULL,

    renovacao_automatica BIT NOT NULL DEFAULT 0,

    data_cancelamento DATE NULL,

    id_motivo_cancelamento INT NULL,

    id_funcionario_cancelamento INT NULL,

    observacoes VARCHAR(255),

    CONSTRAINT FK_ASSINATURA_ALUNO
        FOREIGN KEY (id_aluno)
        REFERENCES alunos(id),

    CONSTRAINT FK_ASSINATURA_PLANO
        FOREIGN KEY (id_plano)
        REFERENCES planos(id),

    CONSTRAINT FK_ASSINATURA_VENDA
        FOREIGN KEY (id_funcionario_venda)
        REFERENCES funcionarios(id),

    CONSTRAINT FK_ASSINATURA_CANCELAMENTO
        FOREIGN KEY (id_funcionario_cancelamento)
        REFERENCES funcionarios(id),

    CONSTRAINT FK_ASSINATURA_MOTIVO
        FOREIGN KEY (id_motivo_cancelamento)
        REFERENCES motivos_cancelamento(id),

    CONSTRAINT CK_STATUS_ASSINATURA
        CHECK (status_assinatura IN ('A','I'))

    -- A = Ativa
    -- I = Inativa
);


/* FATURAS */

CREATE TABLE faturas_pagamento (
    id INT IDENTITY(1,1) PRIMARY KEY,

    id_assinatura INT NOT NULL,

    data_vencimento DATE NOT NULL,

    valor_fatura DECIMAL(10,2) NOT NULL,

    valor_pago DECIMAL(10,2),

    data_pagamento DATETIME,

    id_metodo_pagamento INT NULL,

    status_pagamento CHAR(1) NOT NULL,

    mes_referencia TINYINT NOT NULL,

    ano_referencia SMALLINT NOT NULL,

    multa_aplicada DECIMAL(10,2) NOT NULL DEFAULT 0,

    CONSTRAINT FK_FATURA_ASSINATURA
        FOREIGN KEY (id_assinatura)
        REFERENCES assinaturas(id),

    CONSTRAINT FK_FATURA_METODO
        FOREIGN KEY (id_metodo_pagamento)
        REFERENCES metodos_pagamento(id),

    CONSTRAINT CK_STATUS_PAGAMENTO
        CHECK (status_pagamento IN ('P','C'))

    -- P = Pendente
    -- C = Concluído
);


/* AVALIAÇÕES FÍSICAS */

CREATE TABLE avaliacoes_fisicas (
    id INT IDENTITY(1,1) PRIMARY KEY,

    id_aluno INT NOT NULL,

    id_funcionario_avaliador INT NOT NULL,

    data_avaliacao DATETIME NOT NULL DEFAULT GETDATE(),

    peso_kg DECIMAL(5,2),

    altura_cm SMALLINT,

    percentual_gordura DECIMAL(5,2),

    massa_magra DECIMAL(6,2),

    circunferencia_braco DECIMAL(5,2),

    circunferencia_abdominal DECIMAL(5,2),

    observacoes_progresso VARCHAR(500),

    CONSTRAINT FK_AVALIACAO_ALUNO
        FOREIGN KEY (id_aluno)
        REFERENCES alunos(id),

    CONSTRAINT FK_AVALIACAO_FUNCIONARIO
        FOREIGN KEY (id_funcionario_avaliador)
        REFERENCES funcionarios(id)
);


/* ACESSOS CATRACA */

CREATE TABLE acessos_catraca (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,

    id_aluno INT NOT NULL,

    data_hora_entrada DATETIME NOT NULL,

    data_hora_saida DATETIME NULL,

    sentido_acesso CHAR(1) NOT NULL,

    tipo_acesso CHAR(1) NOT NULL,

    id_dispositivo_catraca INT NULL,

    motivo_bloqueio VARCHAR(100),

    foi_liberacao_manual BIT NOT NULL DEFAULT 0,

    CONSTRAINT FK_ACESSO_ALUNO
        FOREIGN KEY (id_aluno)
        REFERENCES alunos(id),

    CONSTRAINT FK_ACESSO_DISPOSITIVO
        FOREIGN KEY (id_dispositivo_catraca)
        REFERENCES dispositivos_catraca(id),

    CONSTRAINT CK_SENTIDO_ACESSO
        CHECK (sentido_acesso IN ('E','S')),

    -- E = Entrada
    -- S = Saída

    CONSTRAINT CK_TIPO_ACESSO
        CHECK (tipo_acesso IN ('A','V'))

    -- A = Aluno
    -- V = Visitante
);
