
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

 Arquivo fonte: [Modelo Fisico](./modelo-fisico/)

<!-- Insira abaixo a imagem do modelo físico -->
![Modelo Físico do Banco de Dados](https://raw.githubusercontent.com/felipeoliveira0211/Sistema-de-assinatura-para-academia/main/Modelo_fisico/drawSQL-image-export-2026-05-30.jpg.jpg)
---

##  Dicionário de Dados

As informações sobre as tabelas e índices foram documentadas nas planilhas:

-  [`Dicionario_pt1.xlsx`](https://github.com/felipeoliveira0211/projeto_BD2_Unisatc_Ass_academia/blob/main/Dicionario_dados/Dicionario_pt1.xlsx)
-  [`Dicionario_pt2.xlsx`](https://github.com/felipeoliveira0211/projeto_BD2_Unisatc_Ass_academia/blob/main/Dicionario_dados/Dicionario_pt2.xlsx)

---

##  Scripts SQL

O banco de dados utilizado neste projeto é o **SQL Server**.

 Procedure de criação do banco: [Criando SQL](./scripts/criacao-banco.sql)

Os scripts estão organizados por tipo:

| Tipo | Arquivo |
|------|---------|
|  Tabelas | [`scripts/tabelas.sql`](./scripts/tabelas.sql) |
|  Índices | [`scripts/indices.sql`](./scripts/indices.sql) |
|  Gatilhos | [`scripts/gatilhos.sql`](./scripts/gatilhos.sql) |
|  Procedimentos Armazenados | [`scripts/procedures.sql`](./scripts/procedures.sql) |
|  Funções | [`scripts/funcoes.sql`](./scripts/funcoes.sql) |
|  DML | [`scripts/dml.sql`](./scripts/dml.sql) |

---

##  Código Fonte do CRUD

### Tecnologias utilizadas

- **Linguagem de Programação:** PHP
- **Banco de Dados:** SQL Server
- **ORM:** Entity Framework
- **Ferramenta de Modelagem:** drawSQL

>  *Adicione aqui as demais tecnologias utilizadas no desenvolvimento do CRUD.*

---

##  Passos para Execução do CRUD

Siga as instruções abaixo para reproduzir o projeto em sua máquina.

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
```

### 2. Configure o banco de dados

```sql
-- Execute o script de criação do banco
-- scripts/criacao-banco.sql
```

>  *Adicione aqui as demais instruções de configuração e execução.*

---

##  Código Fonte

O código fonte completo está disponível na pasta [`/src`](./src/).

---

##  Relatório Final

O relatório final está disponível em [`relatorio-final/template1.docx`](./relatorio-final/template1.docx).

---

##  Referências Bibliográficas

>  *Adicione aqui as referências de artigos, links, vídeos, repositórios e livros utilizados no desenvolvimento do projeto.*

---

<p align="center">Desenvolvido para a disciplina de Atividades Especiais</p>
