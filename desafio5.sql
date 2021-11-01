CREATE VIEW top_2_hits_do_momento AS
SELECT 
M.nome AS cancao,
COUNT(H.musica_id) AS reproducoes
FROM SpotifyClone.historico AS H
INNER JOIN SpotifyClone.musica AS M
ON H.musica_id = M.musica_id
GROUP BY H.musica_id
ORDER BY 2 DESC,1
LIMIT 2;
