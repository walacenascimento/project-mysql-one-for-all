DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artista_nome VARCHAR(60))
BEGIN
SELECT
A.nome AS 'artista',
AL.nome AS 'album'
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.albums AS AL
ON AL.artista_id = A.artista_id
WHERE A.nome = artista_nome
ORDER BY 2;
END $$

DELIMITER ;
