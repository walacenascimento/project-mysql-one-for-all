CREATE VIEW cancoes_premium AS
SELECT
M.nome AS nome,
COUNT(H.musica_id) AS reproducoes
FROM SpotifyClone.musica AS M
INNER JOIN SpotifyClone.usuario AS U
INNER JOIN SpotifyClone.historico AS H
ON H.musica_id = M.musica_id
AND U.usuario_id = H.usuario_id
WHERE U.plano_id IN(2,3)
GROUP BY H.musica_id
ORDER BY M.nome;
