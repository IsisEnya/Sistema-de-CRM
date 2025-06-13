INSERT INTO fornecedores (nome, cnpj, telefone, email, endereco) VALUES
('Fornecedor A', '00.000.000/0001-00', '(11) 90000-0000', 'a@forn.com', 'Rua Alfa, 1'),
('Fornecedor B', '11.111.111/0001-11', '(11) 91111-1111', 'b@forn.com', 'Rua Beta, 2'),
('Fornecedor C', '22.222.222/0001-22', '(11) 92222-2222', 'c@forn.com', 'Rua Gama, 3'),
('Fornecedor D', '33.333.333/0001-33', '(11) 93333-3333', 'd@forn.com', 'Rua Delta, 4'),
('Fornecedor E', '44.444.444/0001-44', '(11) 94444-4444', 'e@forn.com', 'Rua Épsilon, 5'),
('Fornecedor F', '55.555.555/0001-55', '(11) 95555-5555', 'f@forn.com', 'Rua Zeta, 6'),
('Fornecedor G', '66.666.666/0001-66', '(11) 96666-6666', 'g@forn.com', 'Rua Eta, 7'),
('Fornecedor H', '77.777.777/0001-77', '(11) 97777-7777', 'h@forn.com', 'Rua Teta, 8'),
('Fornecedor I', '88.888.888/0001-88', '(11) 98888-8888', 'i@forn.com', 'Rua Iota, 9'),
('Fornecedor J', '99.999.999/0001-99', '(11) 99999-9999', 'j@forn.com', 'Rua Kappa, 10');





INSERT INTO tipo_produto (nome, descricao) VALUES
('Eletrônicos', 'Dispositivos eletrônicos'),
('Alimentos', 'Produtos alimentícios'),
('Higiene', 'Itens de higiene pessoal'),
('Limpeza', 'Produtos de limpeza'),
('Papelaria', 'Material de escritório'),
('Vestuário', 'Roupas e acessórios'),
('Ferramentas', 'Equipamentos manuais'),
('Esporte', 'Artigos esportivos'),
('Automotivo', 'Produtos para veículos'),
('Móveis', 'Móveis e decoração');



INSERT INTO usuarios (nome, email, senha, ativo) VALUES
('Alice Santos', 'alice@email.com', 'senha1',true ),
('Bruno Lima', 'bruno@email.com', 'senha2', true),
('Carla Silva', 'carla@email.com', 'senha3', false),
('Daniel Souza', 'daniel@email.com', 'senha4', true),
('Elaine Costa', 'elaine@email.com', 'senha5', true),
('Fábio Rocha', 'fabio@email.com', 'senha6', false),
('Gisele Alves', 'gisele@email.com', 'senha7', true),
('Henrique Dias', 'henrique@email.com', 'senha8', true),
('Isabela Nunes', 'isabela@email.com', 'senha9', false),
('João Pedro', 'joao@email.com', 'senha10', true);



INSERT INTO permissoes (nome, descricao) VALUES
('Admin', 'Acesso total ao sistema'),
('Usuário', 'Acesso básico'),
('Financeiro', 'Acesso à área financeira'),
('RH', 'Recursos Humanos'),
('Vendas', 'Área de vendas'),
('TI', 'Tecnologia da Informação'),
('Compras', 'Área de compras'),
('Estoque', 'Controle de estoque'),
('Gerente', 'Gerência geral'),
('Marketing', 'Departamento de marketing');


INSERT INTO usuario_permissao (id_usuario, id_permissao) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


INSERT INTO produtos (nome, descricao, preco, estoque, id_fornecedor, id_tipo_produto) VALUES
('Notebook Dell', 'Laptop i5 8GB RAM', 3200.00, 5, 1, 1),
('Arroz 5kg', 'Pacote de arroz branco', 25.00, 50, 2, 2),
('Sabonete', 'Sabonete neutro', 2.50, 100, 3, 3),
('Detergente', 'Detergente líquido', 3.00, 80, 4, 4),
('Caneta Azul', 'Caneta esferográfica', 1.20, 200, 5, 5),
('Camiseta Polo', 'Camiseta tamanho M', 45.00, 30, 6, 6),
('Martelo', 'Martelo de aço', 35.00, 20, 7, 7),
('Bola de futebol', 'Bola oficial', 120.00, 15, 8, 8),
('Óleo 5W30', 'Óleo sintético', 75.00, 25, 9, 9),
('Cadeira Gamer', 'Ergonômica com apoio lombar', 950.00, 10, 10, 10);


INSERT INTO extrato_saida (id_produto, quantidade, data_saida, obs) VALUES
(1, 1, '2025-06-01', 'Venda direta'),
(2, 2, '2025-06-02', 'Reposição de prateleira'),
(3, 5, '2025-06-03', 'Campanha promocional'),
(4, 3, '2025-06-04', 'Doação'),
(5, 10, '2025-06-05', 'Consumo interno'),
(6, 1, '2025-06-06', 'Troca por defeito'),
(7, 2, '2025-06-07', 'Retirada para uso'),
(8, 1, '2025-06-08', 'Brinde em evento'),
(9, 4, '2025-06-09', 'Venda em lote'),
(10, 2, '2025-06-10', 'Retirada de mostruário');



INSERT INTO historico_compras (id_usuario, id_produto, quantidade, data_compra) VALUES
(1, 1, 1, '2025-06-01'),
(2, 2, 2, '2025-06-02'),
(3, 3, 5, '2025-06-03'),
(4, 4, 3, '2025-06-04'),
(5, 5, 10, '2025-06-05'),
(6, 6, 1, '2025-06-06'),
(7, 7, 2, '2025-06-07'),
(8, 8, 1, '2025-06-08'),
(9, 9, 4, '2025-06-09'),
(10, 10, 2, '2025-06-10');


INSERT INTO promocoes (id_produto, descricao, preco_promocional, data_inicio, data_fim) VALUES
(1, 'Promoção de inverno', 2900.00, '2025-06-01', '2025-06-10'),
(2, 'Semana do arroz', 22.00, '2025-06-02', '2025-06-09'),
(3, 'Leve 5 pague 4', 2.00, '2025-06-03', '2025-06-07'),
(4, 'Desconto de limpeza', 2.50, '2025-06-04', '2025-06-08'),
(5, 'Volta às aulas', 1.00, '2025-06-05', '2025-06-15'),
(6, 'Queima de estoque', 39.90, '2025-06-06', '2025-06-20'),
(7, 'Ferramentas com desconto', 30.00, '2025-06-07', '2025-06-21'),
(8, 'Promoção esportiva', 100.00, '2025-06-08', '2025-06-12'),
(9, 'Óleo com desconto', 65.00, '2025-06-09', '2025-06-13'),
(10, 'Oferta gamer', 899.00, '2025-06-10', '2025-06-17');
