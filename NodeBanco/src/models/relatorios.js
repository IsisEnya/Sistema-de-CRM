const db = require('../db');

// Chama a FUNCTION: total_compras_usuario
const totalComprasPorUsuario = async (idUsuario) => {
  const result = await db.query('SELECT total_compras_usuario($1) AS total', [idUsuario]);
  return result.rows[0].total;
};

// Chama a FUNCTION: produto_em_promocao
const produtoEmPromocao = async (idProduto) => {
  const result = await db.query('SELECT produto_em_promocao($1) AS em_promocao', [idProduto]);
  return result.rows[0].em_promocao;
};

// Chama a PROCEDURE: registrar_saida
const registrarSaida = async (idProduto, quantidade, obs) => {
  await db.query('CALL registrar_saida($1, $2, $3)', [idProduto, quantidade, obs]);
};

module.exports = {
  totalComprasPorUsuario,
  produtoEmPromocao,
  registrarSaida,
};
