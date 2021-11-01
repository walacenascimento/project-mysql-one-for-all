CREATE VIEW historico_reproducao_usuarios AS
SELECT
U.nome AS usuario,
M.nome AS nome
FROM SpotifyClone.historico AS H
INNER JOIN SpotifyClone.usuario AS U
ON H.usuario_id = U.usuario_id
INNER JOIN SpotifyClone.musica AS M
ON H.musica_id = M.musica_id
ORDER BY U.nome ASC, M.nome ASC;
