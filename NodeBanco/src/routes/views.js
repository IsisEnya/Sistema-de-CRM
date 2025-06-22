const express = require('express');
const router = express.Router();
const views = require('../models/views');

// GET /views/usuarios-permissoes
router.get('/usuarios-permissoes', async (req, res) => {
  const data = await views.usuariosComPermissoes();
  res.json(data);
});

// GET /views/estoque-baixo
router.get('/estoque-baixo', async (req, res) => {
  const data = await views.estoqueBaixo();
  res.json(data);
});

// GET /views/compras-completas
router.get('/compras-completas', async (req, res) => {
  const data = await views.comprasCompletas();
  res.json(data);
});

module.exports = router;
