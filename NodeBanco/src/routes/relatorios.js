const express = require('express');
const router = express.Router();
const relatorios = require('../models/relatorios');

// GET /relatorios/total-compras/:idUsuario
router.get('/total-compras/:idUsuario', async (req, res) => {
  const total = await relatorios.totalComprasPorUsuario(req.params.idUsuario);
  res.json({ total });
});

// GET /relatorios/produto-promocao/:idProduto
router.get('/produto-promocao/:idProduto', async (req, res) => {
  const emPromocao = await relatorios.produtoEmPromocao(req.params.idProduto);
  res.json({ emPromocao });
});

// POST /relatorios/registrar-saida
router.post('/registrar-saida', async (req, res) => {
  const { idProduto, quantidade, obs } = req.body;
  await relatorios.registrarSaida(idProduto, quantidade, obs);
  res.status(204).send();
});

module.exports = router;
