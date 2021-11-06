DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE musica INT;
    SELECT COUNT(*)
    FROM SpotifyClone.historico
    WHERE usuario_id = id
    INTO musica;
    RETURN musica;
END $$
DELIMITER ;