CREATE VIEW top_3_artistas AS
SELECT
A.nome AS artista,
COUNT( S.usuario_id) AS seguidores
FROM SpotifyClone.usuario_artista AS S
INNER JOIN SpotifyClone.artista AS A
ON S.artista_id = A.artista_id
GROUP BY A.artista_id
ORDER BY S.artista_id DESC
LIMIT 3;

SELECT * FROM top_3_artistas;
