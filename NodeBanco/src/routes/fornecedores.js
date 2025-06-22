const express = require('express');
const router = express.Router();
const fornecedores = require('../models/fornecedores');

// GET /fornecedores
router.get('/', async (req, res) => {
  const data = await fornecedores.getAll();
  res.json(data);
});

// GET /fornecedores/:id
router.get('/:id', async (req, res) => {
  const data = await fornecedores.getById(req.params.id);

  if (!data) {
    return res.status(404).json({ erro: 'Fornecedor não encontrado' });
  } 
  res.json(data);
});

// POST /fornecedores
router.post('/', async (req, res) => {
  try {
    const novo = await fornecedores.create(req.body);
    res.status(201).json(novo);
  } catch (err) {
    res.status(400).json({ erro: 'Erro ao criar fornecedor', detalhes: err.message });
  }
});

// PUT /fornecedores/:id
router.put('/:id', async (req, res) => {
  try {
    const atualizado = await fornecedores.update(req.params.id, req.body);
    if (!atualizado) return res.status(404).json({ erro: 'Fornecedor não encontrado' });
    res.json(atualizado);
  } catch (err) {
    res.status(400).json({ erro: 'Erro ao atualizar fornecedor', detalhes: err.message });
  }
});

// DELETE /fornecedores/:id
router.delete('/:id', async (req, res) => {
  try {
    await fornecedores.remove(req.params.id);
    res.status(204).send();
  } catch (err) {
    res.status(400).json({ erro: 'Erro ao excluir fornecedor', detalhes: err.message });
  }
});

module.exports = router;