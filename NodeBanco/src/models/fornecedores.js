const db = require('../db');

const getAll = async () => {
  const result = await db.query('SELECT * FROM fornecedores ORDER BY id');
  return result.rows;
};

const getById = async (id) => {
  const result = await db.query('SELECT * FROM fornecedores WHERE id = $1', [id]);
  return result.rows[0];
};

const create = async (produto) => {
  const {
    nome,
    cnpj,
    telefone,
    email,
    endereco,
    created_at,
    updated_at
  } = produto;

  const result = await db.query(
    `INSERT INTO fornecedores (nome, cnpj, telefone, email, endereco, created_at, updated_at)
     VALUES ($1, $2, $3, $4, $5, $6, $7)
     RETURNING *`,
    [nome, cnpj ,telefone ,email ,endereco ,created_at ,updated_at]
  );

  return result.rows[0];
};

const update = async (id, produto) => {
  const {
    nome,
    cnpj,
    telefone,
    email,
    endereco,
    created_at,
    updated_at
  } = produto;

  const result = await db.query(
    `UPDATE fornecedores
     SET nome = $1, cnpj = $2,telefone = $3,email = $4,endereco = $5,created_at = $6,updated_at = $7
     WHERE id = $8
     RETURNING *`,
    [nome, cnpj ,telefone ,email ,endereco ,created_at ,updated_at, id]
  );

  return result.rows[0];
};

const remove = async (id) => {
  await db.query('DELETE FROM fornecedores WHERE id = $1', [id]);
};

module.exports = {
  getAll,
  getById,
  create,
  update,
  remove
};
