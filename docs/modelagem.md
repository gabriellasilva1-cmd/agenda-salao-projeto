# Modelagem do banco de dados — Agenda do Salão

## Objetivo

O sistema organiza os agendamentos de um salão de beleza, relacionando clientes, profissionais e serviços.

## Modelo conceitual

Diagrama: [abrir modelo conceitual](modelo-conceitual.svg).

### Entidades e atributos

- **Cliente:** id, nome, telefone, email.
- **Profissional:** id, nome, especialidade, ativo.
- **Serviço:** id, nome, preço, duração em minutos.
- **Agendamento:** id, data e hora, status.

### Relacionamentos e cardinalidades

- Um **Cliente** pode realizar vários **Agendamentos**. Cada agendamento pertence a um cliente (1:N).
- Um **Profissional** pode atender vários **Agendamentos**. Cada agendamento é atribuído a um profissional (1:N).
- Um **Serviço** pode aparecer em vários **Agendamentos**. Cada agendamento seleciona um serviço (1:N).

## Modelo lógico

Diagrama: [abrir modelo lógico](modelo-logico.svg).

| Tabela | Campos |
|---|---|
| clientes | id (PK), nome, telefone, email |
| profissionais | id (PK), nome, especialidade, ativo |
| servicos | id (PK), nome, preco, duracao_min |
| agendamentos | id (PK), cliente_id (FK), profissional_id (FK), servico_id (FK), data_hora, status |

As três chaves estrangeiras ficam em `agendamentos`, conectando cada agendamento ao cliente, profissional e serviço correspondentes.

## Modelo físico

O modelo físico está em [schema.sql](../database/schema.sql). Ele cria as quatro tabelas, define tipos de dados, chaves primárias, chaves estrangeiras e restrições.

## Diagrama de classes (visão inicial)

O código-fonte Mermaid está em [diagrama-classes.mmd](diagrama-classes.mmd).
