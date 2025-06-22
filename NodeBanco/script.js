const apiBase = 'http://localhost:3000/produtos';

const form = document.getElementById('produto-form');
const idInput = document.getElementById('produto-id');
const nomeInput = document.getElementById('nome');
const descricaoInput = document.getElementById('descricao');
const precoInput = document.getElementById('preco');
const estoqueInput = document.getElementById('estoque');
const fornecedorInput = document.getElementById('id_fornecedor');
const tipoInput = document.getElementById('id_tipo_produto');
const tabela = document.getElementById('tabela-produtos');
const formTitle = document.getElementById('form-title');

async function carregarProdutos() {
    const res = await fetch(apiBase);
    const produtos = await res.json();
    tabela.innerHTML = '';

    produtos.forEach(p => {
        const precoFormatado = Number(p.preco) ? Number(p.preco).toFixed(2).replace('.', ',') : '—';

        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${p.id}</td>
            <td>${p.nome}</td>
            <td>${p.descricao || ''}</td>
            <td>R$ ${precoFormatado}</td>
            <td>${p.estoque ?? '—'}</td>
            <td>${p.id_fornecedor ?? '—'}</td>
            <td>${p.id_tipo_produto ?? '—'}</td>
            <td class="actions">
                <button onclick="editarProduto(${p.id}, \`${p.nome}\`, \`${p.descricao || ''}\`, ${p.preco}, ${p.estoque ?? 0}, ${p.id_fornecedor ?? 0}, ${p.id_tipo_produto ?? 0})"><a href="#form-title">Editar</a></button>
                <button onclick="excluirProduto(${p.id})">Excluir</button>
            </td>
        `;
        tabela.appendChild(tr);
    });
}

form.addEventListener('submit', async e => {
    e.preventDefault();

    const produto = {
        nome: nomeInput.value.trim(),
        descricao: descricaoInput.value.trim(),
        preco: parseFloat(precoInput.value),
        estoque: parseInt(estoqueInput.value),
        id_fornecedor: parseInt(fornecedorInput.value),
        id_tipo_produto: parseInt(tipoInput.value)
    };

    try {
        const id = idInput.value;
        if (id) {
            const res = await fetch(`${apiBase}/${id}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(produto)
            });
            if (!res.ok) throw new Error('Erro ao atualizar produto');
        } else {
            const res = await fetch(apiBase, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(produto)
            });
            if (!res.ok) throw new Error('Erro ao criar produto');
        }

        cancelarEdicao();
        carregarProdutos();
    } catch (err) {
        alert(err.message);
    }
});

function editarProduto(id, nome, descricao, preco, estoque, id_fornecedor, id_tipo_produto) {
    idInput.value = id;
    nomeInput.value = nome;
    descricaoInput.value = descricao;
    precoInput.value = preco;
    estoqueInput.value = estoque;
    fornecedorInput.value = id_fornecedor;
    tipoInput.value = id_tipo_produto;
    formTitle.textContent = 'Editar Produto';
}

async function excluirProduto(id) {
    if (confirm('Tem certeza que deseja excluir este produto?')) {
        const res = await fetch(`${apiBase}/${id}`, { method: 'DELETE' });
        if (res.ok) carregarProdutos();
        else alert('Erro ao excluir');
    }
}

function cancelarEdicao() {
    form.reset();
    idInput.value = '';
    formTitle.textContent = 'Adicionar Produto';
}

carregarProdutos();
