const db = require('../db');  // Altere conforme sua configuração de conexão com o banco

module.exports = {
  async getAll() {
    const result = await db.query('SELECT * FROM fornecedores');
    return result.rows;
  },

  async getById(id) {
    const result = await db.query('SELECT * FROM fornecedores WHERE id = $1', [id]);
    return result.rows[0];
  },

  async create(fornecedor) {
    const result = await db.query(
      'INSERT INTO fornecedores (nome, contato) VALUES ($1, $2) RETURNING *',
      [fornecedor.nome, fornecedor.contato]
    );
    return result.rows[0];
  },

  async update(id, fornecedor) {
    const result = await db.query(
      'UPDATE fornecedores SET nome = $1, contato = $2 WHERE id = $3 RETURNING *',
      [fornecedor.nome, fornecedor.contato, id]
    );
    return result.rows[0];
  },

  async remove(id) {
    await db.query('DELETE FROM fornecedores WHERE id = $1', [id]);
  }
};
