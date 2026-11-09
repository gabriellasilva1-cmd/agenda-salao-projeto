-- Projeto Integrado - Agenda do Salao
-- Banco de dados: SQLite

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT NOT NULL,
    email TEXT UNIQUE
);

CREATE TABLE IF NOT EXISTS profissionais (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    especialidade TEXT,
    ativo INTEGER NOT NULL DEFAULT 1 CHECK (ativo IN (0, 1))
);

CREATE TABLE IF NOT EXISTS servicos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    preco REAL NOT NULL CHECK (preco >= 0),
    duracao_min INTEGER NOT NULL CHECK (duracao_min > 0)
);

CREATE TABLE IF NOT EXISTS agendamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER NOT NULL,
    profissional_id INTEGER NOT NULL,
    servico_id INTEGER NOT NULL,
    data_hora TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'agendado'
        CHECK (status IN ('agendado', 'concluido', 'cancelado')),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE RESTRICT,
    FOREIGN KEY (profissional_id) REFERENCES profissionais(id) ON DELETE RESTRICT,
    FOREIGN KEY (servico_id) REFERENCES servicos(id) ON DELETE RESTRICT
);

-- Impede dois agendamentos ativos do mesmo profissional no mesmo horario.
CREATE UNIQUE INDEX IF NOT EXISTS idx_horario_unico
ON agendamentos (profissional_id, data_hora)
WHERE status <> 'cancelado';
