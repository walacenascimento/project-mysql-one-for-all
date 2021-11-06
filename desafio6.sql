CREATE VIEW faturamento_atual AS 
SELECT
ROUND(MIN(preco),2) AS faturamento_minimo,
ROUND(MAX(preco),2) AS faturamento_maximo,
ROUND(AVG(preco),2) AS faturamento_medio,
ROUND(SUM(preco),2) AS faturamento_total
FROM SpotifyClone.usuario AS U
INNER JOIN SpotifyClone.plano AS P
ON U.plano_id = P.plano_id;
