"""Conexao inicial do projeto Agenda do Salao com SQLite."""

from pathlib import Path
import sqlite3

BASE_DIR = Path(__file__).resolve().parent
DB_PATH = BASE_DIR / "agenda_salao.db"
SCHEMA_PATH = BASE_DIR / "schema.sql"


def conectar():
    """Abre uma conexao com o banco e habilita as chaves estrangeiras."""
    conexao = sqlite3.connect(DB_PATH)
    conexao.row_factory = sqlite3.Row
    conexao.execute("PRAGMA foreign_keys = ON")
    return conexao


def inicializar_banco():
    """Cria as tabelas definidas em schema.sql, caso ainda nao existam."""
    sql = SCHEMA_PATH.read_text(encoding="utf-8")
    with conectar() as conexao:
        conexao.executescript(sql)


if __name__ == "__main__":
    inicializar_banco()
    print(f"Banco inicializado em: {DB_PATH}")
