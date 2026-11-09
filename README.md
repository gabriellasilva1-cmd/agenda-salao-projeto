# Agenda do Salão — Projeto Integrado

Projeto Integrado das disciplinas de Desenvolvimento Web, Programação Orientada a Objetos e Banco de Dados.

## Etapa 1 — Modelagem e banco de dados

Esta etapa contém a modelagem inicial do sistema, o script SQL e a conexão inicial do Python com SQLite.

### Estrutura

- `database/schema.sql`: criação das tabelas e restrições.
- `database/conexao.py`: conexão e inicialização do banco SQLite.
- `docs/modelagem.md`: descrição dos modelos conceitual, lógico e físico.
- `docs/diagrama-classes.mmd`: diagrama inicial de classes UML em Mermaid.

### Como inicializar o banco

Requisito: Python 3 instalado.

Na pasta principal do projeto, execute:

```bash
python database/conexao.py
```

O arquivo `database/agenda_salao.db` será criado automaticamente com as tabelas:

- clientes
- profissionais
- servicos
- agendamentos

### Relacionamentos

- clientes 1:N agendamentos
- profissionais 1:N agendamentos
- servicos 1:N agendamentos

As chaves estrangeiras são verificadas pelo SQLite. Um profissional não pode ter dois agendamentos ativos no mesmo horário.

## Próximas etapas

- Etapa 2: implementar classes, DAOs e rotas Flask para cadastro e consulta.
- Entrega final: integrar o front-end HTML/CSS/JavaScript às rotas Flask.
