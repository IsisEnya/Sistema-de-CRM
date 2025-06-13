-- SCRIPT DE OBJETOS OBRIGATÓRIOS COM JUSTIFICATIVAS
-- Projeto de Banco de Dados

-- ====================================
-- 1. TRIGGER: Atualiza campo updated_at da tabela produtos
-- Justificativa: Garante a rastreabilidade das atualizações nos produtos, 
-- mantendo o campo updated_at sempre com a data da última modificação.

CREATE OR REPLACE FUNCTION atualiza_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_produto
BEFORE UPDATE ON produtos
FOR EACH ROW
EXECUTE FUNCTION atualiza_updated_at();

-- ====================================
-- 2. FUNCTIONS / PROCEDURES

-- 2.1. Calcular total de compras de um usuário
-- Justificativa: Permite gerar relatórios financeiros ou dashboards por usuário.

CREATE OR REPLACE FUNCTION total_compras_usuario(uid INT)
RETURNS NUMERIC AS $$
  SELECT SUM(p.preco * h.quantidade)
  FROM historico_compras h
  JOIN produtos p ON p.id = h.id_produto
  WHERE h.id_usuario = uid;
$$ LANGUAGE SQL;

-- 2.2. Verificar se um produto está em promoção
-- Justificativa: Facilita regras de negócio como exibir selos de "Promoção" no frontend.

CREATE OR REPLACE FUNCTION produto_em_promocao(pid INT)
RETURNS BOOLEAN AS $$
  SELECT EXISTS (
    SELECT 1 FROM promocoes
    WHERE id_produto = pid
      AND CURRENT_DATE BETWEEN data_inicio AND data_fim
  );
$$ LANGUAGE SQL;

-- 2.3. Reduzir estoque ao registrar saída
-- Justificativa: Automatiza duas operações críticas em uma única chamada.

CREATE OR REPLACE FUNCTION registrar_saida(
  pid INT, qtd INT, obs TEXT
)
RETURNS VOID AS $$
BEGIN
  INSERT INTO extrato_saida (id_produto, quantidade, data_saida, obs, created_at)
  VALUES (pid, qtd, CURRENT_DATE, obs, NOW());

  UPDATE produtos SET estoque = estoque - qtd WHERE id = pid;
END;
$$ LANGUAGE plpgsql;

-- ====================================
-- 3. VIEWS

-- 3.1. View de usuários com permissões
-- Justificativa: Facilita a consulta das permissões de cada usuário para painéis administrativos.

CREATE VIEW vw_usuarios_permissoes AS
SELECT u.id, u.nome, p.nome AS permissao
FROM usuarios u
JOIN usuario_permissao up ON up.id_usuario = u.id
JOIN permissoes p ON p.id = up.id_permissao;

-- 3.2. View de produtos com estoque baixo
-- Justificativa: Ajuda na tomada de decisão sobre reposição de estoque.

CREATE VIEW vw_estoque_baixo AS
SELECT id, nome, estoque
FROM produtos
WHERE estoque < 10;

-- 3.3. View de compras com dados completos
-- Justificativa: Consolida as compras realizadas com informações completas para relatórios.

CREATE VIEW vw_compras_completas AS
SELECT h.id, u.nome AS usuario, p.nome AS produto, h.quantidade, h.data_compra
FROM historico_compras h
JOIN usuarios u ON u.id = h.id_usuario
JOIN produtos p ON p.id = h.id_produto;
