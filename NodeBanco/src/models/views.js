const db = require('../db');

// View: vw_usuarios_permissoes
const usuariosComPermissoes = async () => {
  const result = await db.query('SELECT * FROM vw_usuarios_permissoes');
  return result.rows;
};

// View: vw_estoque_baixo
const estoqueBaixo = async () => {
  const result = await db.query('SELECT * FROM vw_estoque_baixo');
  return result.rows;
};

// View: vw_compras_completas
const comprasCompletas = async () => {
  const result = await db.query('SELECT * FROM vw_compras_completas');
  return result.rows;
};

module.exports = {
  usuariosComPermissoes,
  estoqueBaixo,
  comprasCompletas,
};
