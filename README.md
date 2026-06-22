
#  Sistema de Gestão para Academia 3GFIT
### Projeto Sistema de Atividades Especiais 

O Sistema de Gestão para Academia 3GFIT consiste no desenvolvimento de um banco de dados relacional para gerenciamento das operações de uma academia. O projeto foi modelado e implementado utilizando SQL Server, aplicando conceitos de modelagem de dados, normalização, integridade referencial, chaves primárias e estrangeiras, além de restrições para garantir a consistência das informações.

O sistema contempla operações de CRUD (Create, Read, Update e Delete), desenvolvidas em PHP, permitindo o gerenciamento dos dados armazenados no banco de dados. Entre as principais funcionalidades estão o cadastro de alunos, funcionários, planos, assinaturas, pagamentos, avaliações físicas e controle de acesso por catraca.

Este projeto foi desenvolvido como atividade acadêmica com o objetivo de aplicar, na prática, os conhecimentos adquiridos na disciplina de Banco de Dados, integrando conceitos de modelagem, implementação e manipulação de dados.

---

##  Integrantes

| Nome | GitHub |
|------|--------|
| Gabriel de Limas Mendes | [@gabrielmendes165](https://github.com/gabrielmendes165) |
| Gustavo Rossa | [@GustavoRossa](https://github.com/GustavoRossa) |
| Guilherme Rossa | [@guilhermerossa2026](https://github.com/guilhermerossa2026) |
| Luiz Filipe Oliveira | [@felipeoliveira0211](https://github.com/felipeoliveira0211) |

---

##  Modelo Físico

Utilizamos a ferramenta [drawSQL](https://drawsql.app/) para a criação do modelo físico do banco de dados, com posterior exportação dos scripts DDL das tabelas e relacionamentos.

| Modelo Físico | [`modelo_fisico`](https://github.com/felipeoliveira0211/Sistema-de-assinatura-para-academia/tree/main/Modelo_fisico) |

<!-- Insira abaixo a imagem do modelo físico -->
![Modelo Físico do Banco de Dados](https://raw.githubusercontent.com/felipeoliveira0211/Sistema-de-assinatura-para-academia/main/Modelo_fisico/drawSQL-image-export-2026-05-30.jpg.jpg)
---

##  Dicionário de Dados

As informações sobre as tabelas e índices foram documentadas nas planilhas:

| Dicionário de Dados | [`dicionario_dados.xlsx`](./Dicionario_dados/Dicionário%20de%20Dados.xlsx) |
---

##  Scripts SQL

O banco de dados utilizado neste projeto é o **SQL Server**.

 Procedure de criação do banco: [Criando SQL](https://github.com/felipeoliveira0211/Sistema-de-assinatura-para-academia/blob/main/Modelo_fisico/DDL_tabelas_modelo_fisico.sql)

Os scripts estão organizados por tipo:

| Tipo | Arquivo |
|------|---------|
| Tabelas | [`scripts/tabelas.sql`](./Scripts/DDL/Tabelas/Criação_tabelas.sql) |
| Índices | [`scripts/indices.sql`](./Scripts/DDL/Tabelas/Indices.sql) |
| Gatilhos | [`scripts/gatilhos.sql`](./trigger/trigger.sql) |
| Procedimentos Armazenados | [`scripts/procedures.sql`](./procedure/storedProcedure.sql) |
| Funções | [`scripts/funcoes.sql`](./Scripts/DDL/Tabelas/function.sql) |
| DML | [`scripts/dml.sql`](./Scripts/DML/INSERTS_MASSA_DADOS_TABELAS.sql) |

---

##  Código Fonte do CRUD

### Tecnologias utilizadas

- **Linguagem de Programação:** PHP
- **Banco de Dados:** SQL Server
- **Ferramenta de Modelagem:** drawSQL


---

##  Passos para Execução do CRUD

Siga as instruções abaixo para reproduzir o projeto em sua máquina.

### 1. Clone o repositório

```bash
git clone Repositório: https://github.com/felipeoliveira0211/Sistema-de-assinatura-para-academia
cd Sistema-de-assinatura-para-academia
```

### 2. Configure o banco de dados

Execute os scripts na seguinte ordem no **SQL Server Management Studio (SSMS)**:

```sql
-- 1. Crie as tabelas
-- Scripts/DDL/Tabelas/Criação_tabelas.sql

-- 2. Crie os índices
-- Scripts/DDL/Tabelas/Indices.sql

-- 3. Popule o banco
-- (script DML)
```

---
### 3. Configure o CRUD em PHP

- Abra a pasta `Crud/` no seu editor
- Edite o arquivo de conexão com as credenciais do seu SQL Server
- Suba o projeto em um servidor local (XAMPP, Laragon, etc.)
- Acesse via navegador: `http://localhost/Crud`

---

## Código Fonte

O código fonte do CRUD está disponível na pasta [`/Crud`](./Crud/).

---

##  Relatório Final

| Relatório Final | [`relatorio_final.pdf`](./relatorio-final/RELATORIO%20FINAL%20ASSINATURA%20ACADEMIA..pdf) |

---

##  Referências Bibliográficas

- [Documentação SQL Server — Microsoft](https://learn.microsoft.com/pt-br/sql/sql-server/)
- [drawSQL — Ferramenta de modelagem](https://drawsql.app/)
- [PHP Manual](https://www.php.net/manual/pt_BR/)

---

<p align="center">Desenvolvido para a disciplina de <strong>Banco de Dados II</strong></p>
