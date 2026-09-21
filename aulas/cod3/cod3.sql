-- Active: 1788910601723@@127.0.0.1@5432@bd_aula@public
DROP TABLE IF EXISTS vendas_itens;

CREATE TABLE vendas_itens(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    venda_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    valor_unitario NUMERIC(10,2) NOT NULL,
    data_venda DATE NOT NULL,
    observacao TEXT
);

SELECT * FROM vendas_itens;

INSERT INTO vendas_itens (venda_id, produto_id, valor_unitario, data_venda, observacao) VALUES
-- Cinco vendas com cinco itens cada (venda_id 2001 a 2005)
(2001,  1, 150.55, '2025-09-01', 'Entrega expressa'),
(2001,  3,  45.00, '2025-09-01', NULL),
(2001,  5,  12.75, '2025-09-01', NULL),
(2001,  9,  88.78, '2025-09-01', 'Item em promocao'),
(2001, 10,  10.00, '2025-09-01', NULL),

(2002,  2,  99.90, '2025-09-02', NULL),
(2002,  4, 220.00, '2025-09-02', 'Entrega agendada'),
(2002,  6,  60.00, '2025-09-02', NULL),
(2002,  8,  34.50, '2025-09-02', NULL),
(2002,  1, 150.55, '2025-09-02', 'Retirada na loja'),

(2003,  7, 199.99, '2025-09-03', NULL),
(2003,  9,  88.78, '2025-09-03', 'Troca autorizada'),
(2003,  3,  45.00, '2025-09-03', NULL),
(2003,  2,  99.90, '2025-09-03', NULL),
(2003,  5,  12.75, '2025-09-03', NULL),

(2004,  4, 220.00, '2025-09-04', 'Entrega expressa'),
(2004,  6,  60.00, '2025-09-04', NULL),
(2004,  1, 150.55, '2025-09-04', NULL),
(2004,  7, 199.99, '2025-09-04', 'Cliente preferencial'),
(2004, 10,  10.00, '2025-09-04', NULL),

(2005,  8,  34.50, '2025-09-05', NULL),
(2005,  9,  88.78, '2025-09-05', 'Retirada na loja'),
(2005,  2,  99.90, '2025-09-05', NULL),
(2005,  3,  45.00, '2025-09-05', NULL),
(2005,  4, 220.00, '2025-09-05', 'Entrega agendada'),

(2006,  1, 150.55, '2025-09-06', NULL),
(2006,  5,  12.75, '2025-09-06', NULL),
(2006,  9,  88.78, '2025-09-06', NULL),
(2006, 10,  10.00, '2025-09-06', NULL),

(2007,  7, 199.99, '2025-09-07', 'Item em promocao'),
(2007,  6,  60.00, '2025-09-07', NULL),
(2007,  8,  34.50, '2025-09-07', NULL),
(2007,  2,  99.90, '2025-09-07', NULL),

(2008,  3,  45.00, '2025-09-08', NULL),
(2008,  4, 220.00, '2025-09-08', 'Entrega expressa'),
(2008,  1, 150.55, '2025-09-08', NULL),
(2008,  9,  88.78, '2025-09-08', NULL),

(2009,  5,  12.75, '2025-09-09', NULL),
(2009, 10,  10.00, '2025-09-09', NULL),
(2009,  6,  60.00, '2025-09-09', NULL),
(2009,  7, 199.99, '2025-09-09', 'Retirada na loja'),


(2010,  2,  99.90, '2025-09-10', NULL),
(2010,  3,  45.00, '2025-09-10', NULL),

(2011,  8,  34.50, '2025-09-11', NULL),
(2011,  9,  88.78, '2025-09-11', NULL),


(2012,  4, 220.00, '2025-09-12', 'Cliente preferencial'),
(2013,  1, 150.55, '2025-09-13', NULL),
(2014, 10,  10.00, '2025-09-14', NULL),
(2015,  5,  12.75, '2025-09-15', NULL),
(2016,  7, 199.99, '2025-09-16', 'Entrega agendada');

SELECT 
    venda_id, produto_id, valor_unitario, data_venda 
FROM 
    vendas_itens;

SELECT 
    venda_id, data_venda, produto_id, valor_unitario 
FROM 
    vendas_itens WHERE venda_id = 2001;

SELECT 
    id, venda_id, produto_id, produto_id / 3 AS divisao_inteira, 
    produto_id % 3 AS resto, produto_id / 3.0 AS divisao_decimal, 
    produto_id * 3 AS multiplicacao,
    produto_id + 3 AS soma, 
    produto_id - 3 AS subtracao 
FROM 
    vendas_itens 
WHERE 
    produto_id = 10;

SELECT 
    produto_id 110 / 10 * 100 AS 10porcento 
FROM 
    vendas_itens
WHERE 
    produto_id = 10;

SELECT 
    venda_id, data_venda, produto_id, valor_unitario, valor_unitario * 1.1 AS valor_venda 
FROM 
    vendas_itens;

SELECT 
    'Venda ' || venda_id || ', produto ' || produto_id AS "Descrição", valor_unitario 
FROM 
    vendas_itens 
WHERE 
    venda_id = 2001;

SELECT 
    venda_id, produto_id, valor_unitario, data_venda 
FROM 
    vendas_itens 
WHERE 
    data_venda = '2025-09-01' OR data_venda = '2025-09-02' AND valor_unitario > 100;

SELECT 
    venda_id, produto_id, valor_unitario, data_venda 
FROM 
    vendas_itens 
WHERE 
    (data_venda = '2025-09-01' OR data_venda = '2025-09-02') AND valor_unitario > 100;

SELECT 
    venda_id, produto_id, valor_unitario, data_venda 
FROM 
    vendas_itens 
WHERE 
    valor_unitario BETWEEN 50 AND 100 
ORDER BY 
    valor_unitario DESC;

SELECT 
    venda_id, produto_id, valor_unitario, data_venda 
FROM 
    vendas_itens 
WHERE 
    data_venda BETWEEN '2025-09-01' AND '2025-09-03' 
ORDER BY 
    data_venda;

SELECT 
    venda_id, produto_id, valor_unitario, data_venda 
FROM 
    vendas_itens 
WHERE 
    produto_id IN (1, 3, 6) 
ORDER BY 
    produto_id;

SELECT 
    venda_id, produto_id, valor_unitario, data_venda 
FROM 
    vendas_itens 
WHERE 
    produto_id IN (1, 3, 6) AND (data_venda = '2025-09-01' or data_venda = '2025-09-10');

SELECT 
    venda_id, produto_id, valor_unitario, data_venda 
FROM 
    vendas_itens 
WHERE 
    produto_id IN (1, 3, 6) AND (data_venda IN ('2025-09-01', '2025-09-10'));

SELECT 
    venda_id, produto_id, valor_unitario, data_venda 
FROM 
    vendas_itens 
WHERE 
    produto_id NOT IN (1, 3, 6) 
ORDER BY 
    produto_id;

SELECT 
    venda_id, produto_id, valor_unitario, data_venda 
FROM 
    vendas_itens 
WHERE 
    produto_id NOT IN (1, 3, 6) AND (data_venda NOT IN ('2025-09-01', '2025-09-10'));

SELECT 
    venda_id, produto_id, observacao 
FROM 
    vendas_itens 
WHERE 
    observacao LIKE 'Entrega%';

SELECT 
    venda_id, produto_id, observacao 
FROM 
    vendas_itens 
WHERE 
    observacao LIKE '%loja%';

SELECT 
    venda_id, produto_id, observacao 
FROM 
    vendas_itens 
WHERE 
    observacao LIKE '_ntrega%';

SELECT 
    venda_id, produto_id, observacao
FROM 
    vendas_itens
WHERE 
    observacao ILIKE 'entrega%';

SELECT 
    venda_id, produto_id, observacao 
FROM 
    vendas_itens 
WHERE 
    observacao NOT LIKE 'Entrega%';

SELECT 
    venda_id, observacao 
FROM 
    vendas_itens 
WHERE 
    observacao IS NULL;

SELECT 
    venda_id, observacao 
FROM 
    vendas_itens 
WHERE 
    observacao IS NOT NULL;

SELECT 
    venda_id, observacao 
FROM 
    vendas_itens 
WHERE 
    observacao NOT IN ('Entrega expressa');

SELECT 
    venda_id, observacao 
FROM 
    vendas_itens 
WHERE 
    observacao NOT IN ('Entrega expressa') OR observacao IS NULL;

SELECT 
    venda_id, produto_id, COALESCE(observacao, 'Sem observação') AS "Observação" 
FROM 
    vendas_itens 
WHERE 
    venda_id = 2001;

SELECT 
    valor_unitario 
FROM 
    vendas_itens 
ORDER BY 
    valor_unitario;

SELECT DISTINCT 
    valor_unitario 
FROM 
    vendas_itens 
ORDER BY 
    valor_unitario;

SELECT DISTINCT 
    produto_id 
FROM 
    vendas_itens 
ORDER BY 
    produto_id;

SELECT 
    venda_id, produto_id, valor_unitario 
FROM 
    vendas_itens 
ORDER BY 
    valor_unitario DESC, venda_id ASC, produto_id;

SELECT 
    venda_id, observacao 
FROM 
    vendas_itens 
ORDER BY 
    observacao ASC NULLS FIRST;

SELECT 
    venda_id, observacao FROM 
    vendas_itens 
ORDER BY 
    venda_id ASC, observacao ASC NULLS FIRST;

SELECT 
    venda_id, produto_id, valor_unitario 
FROM 
    vendas_itens 
ORDER BY 
    valor_unitario DESC, venda_id ASC, produto_id;

SELECT 
    venda_id, produto_id, valor_unitario 
FROM 
    vendas_itens 
ORDER BY 
    valor_unitario DESC, venda_id ASC, produto_id ASC LIMIT 10;

SELECT 
    venda_id, produto_id, valor_unitario 
FROM 
    vendas_itens 
ORDER BY 
    valor_unitario DESC, venda_id ASC, produto_id ASC LIMIT 10 OFFSET 2;

SELECT 
    COUNT(*) AS itens, 
    COUNT(observacao) AS itens_com_observacao, 
    COUNT(DISTINCT venda_id) AS vendas, 
    COUNT(DISTINCT produto_id) AS produtos, 
    SUM(valor_unitario) AS soma_tudo, 
    ROUND(AVG(valor_unitario), 2) AS media, 
    MIN(valor_unitario) AS minimo, 
    MAX(valor_unitario) AS maximo 
FROM 
    vendas_itens;

SELECT 
    venda_id, SUM(valor_unitario) AS valor_total, data_venda 
FROM 
    vendas_itens 
GROUP BY 
    venda_id, data_venda 
ORDER BY 
    valor_total ASC;

SELECT 
    produto_id, SUM(valor_unitario) AS valor_final, COUNT(*) AS vezes_vendido 
FROM 
    vendas_itens 
GROUP BY 
    produto_id 
ORDER BY 
    valor_final DESC, vezes_vendido;