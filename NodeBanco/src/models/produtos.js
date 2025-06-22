const db = require('../db');

const getAll = async () => {
  const result = await db.query('SELECT * FROM produtos ORDER BY id');
  return result.rows;
};

const getById = async (id) => {
  const result = await db.query('SELECT * FROM produtos WHERE id = $1', [id]);
  return result.rows[0];
};

const create = async (produto) => {
  const {
    nome,
    descricao,
    preco,
    estoque,
    id_fornecedor,
    id_tipo_produto
  } = produto;

  const result = await db.query(
    `INSERT INTO produtos (nome, descricao, preco, estoque, id_fornecedor, id_tipo_produto)
     VALUES ($1, $2, $3, $4, $5, $6)
     RETURNING *`,
    [nome, descricao, preco, estoque, id_fornecedor, id_tipo_produto]
  );

  return result.rows[0];
};

const update = async (id, produto) => {
  const {
    nome,
    descricao,
    preco,
    estoque,
    id_fornecedor,
    id_tipo_produto
  } = produto;

  const result = await db.query(
    `UPDATE produtos
     SET nome = $1, descricao = $2, preco = $3, estoque = $4, id_fornecedor = $5, id_tipo_produto = $6
     WHERE id = $7
     RETURNING *`,
    [nome, descricao, preco, estoque, id_fornecedor, id_tipo_produto, id]
  );

  return result.rows[0];
};

const remove = async (id) => {
  await db.query('DELETE FROM produtos WHERE id = $1', [id]);
};

module.exports = {
  getAll,
  getById,
  create,
  update,
  remove
};
