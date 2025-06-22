const express = require('express');
const app = express();
require('dotenv').config();

app.use(express.json());

const produtosRouter      = require('./src/routes/produtos');
const relatoriosRouter    = require('./src/routes/relatorios');
const fornecedoresRouter  = require('./src/routes/fornecedores');
const viewsRouter         = require('./src/routes/views');

app.use('/produtos', produtosRouter);
app.use('/relatorios', relatoriosRouter);
app.use('/fornecedores', fornecedoresRouter);
app.use('/views', viewsRouter);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando em http://localhost:${PORT}`);
});
