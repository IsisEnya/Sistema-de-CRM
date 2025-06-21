const express = require('express');
const router = express.Router();
const produtos = require('../models/produtos');

// GET /produtos
router.get('/', async (req, res) => {
  const data = await produtos.getAll();
  res.json(data);
});

// GET /produtos/:id
router.get('/:id', async (req, res) => {
  const data = await produtos.getById(req.params.id);

  if (!data) {
    return res.status(404).json({ erro: 'Produto não encontrado' });
  } 
  res.json(data);
});

// POST /produtos
router.post('/', async (req, res) => {
  try {
    const novo = await produtos.create(req.body);
    res.status(201).json(novo);
  } catch (err) {
    res.status(400).json({ erro: 'Erro ao criar produto', detalhes: err.message });
  }
});

// PUT /produtos/:id
router.put('/:id', async (req, res) => {
  try {
    const atualizado = await produtos.update(req.params.id, req.body);
    if (!atualizado) return res.status(404).json({ erro: 'Produto não encontrado' });
    res.json(atualizado);
  } catch (err) {
    res.status(400).json({ erro: 'Erro ao atualizar produto', detalhes: err.message });
  }
});

// DELETE /produtos/:id
router.delete('/:id', async (req, res) => {
  try {
    await produtos.remove(req.params.id);
    res.status(204).send();
  } catch (err) {
    res.status(400).json({ erro: 'Erro ao excluir produto', detalhes: err.message });
  }
});

module.exports = router;