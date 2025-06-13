-- 1. fornecedores
CREATE TABLE fornecedores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(20),
    telefone VARCHAR(20),
    email VARCHAR(255),
    endereco TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. tipo_produto
CREATE TABLE tipo_produto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. produtos
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0,
    id_fornecedor INT REFERENCES fornecedores(id),
    id_tipo_produto INT REFERENCES tipo_produto(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. usuarios
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. permissoes
CREATE TABLE permissoes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- 6. usuario_permissao (relacionamento N:N)
CREATE TABLE usuario_permissao (
    id_usuario INT REFERENCES usuarios(id) ON DELETE CASCADE,
    id_permissao INT REFERENCES permissoes(id) ON DELETE CASCADE,
    PRIMARY KEY (id_usuario, id_permissao)
);

-- 7. extrato_saida
CREATE TABLE extrato_saida (
    id SERIAL PRIMARY KEY,
    id_produto INT REFERENCES produtos(id),
    quantidade INT NOT NULL,
    data_saida DATE NOT NULL,
    obs TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 8. historico
CREATE TABLE historico_compras (
    id SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuarios(id),
    id_produto INT NOT NULL REFERENCES produtos(id),
    quantidade INT NOT NULL,
    data_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 9. promocoes
CREATE TABLE promocoes (
    id SERIAL PRIMARY KEY,
    id_produto INT REFERENCES produtos(id),
    descricao TEXT,
    preco_promocional DECIMAL(10,2),
    data_inicio DATE,
    data_fim DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
