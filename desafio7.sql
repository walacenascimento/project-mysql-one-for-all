CREATE VIEW perfil_artistas AS
    SELECT 
        AR.nome AS artista,
        AL.nome AS album,
        COUNT(S.artista_id) AS seguidores
    FROM
        SpotifyClone.artista AS AR
            INNER JOIN
        SpotifyClone.albums AS AL ON AR.artista_id = AL.artista_id
            INNER JOIN
        SpotifyClone.usuario_artista AS S ON AR.artista_id = S.artista_id
    GROUP BY S.artista_id , AL.album_id
    ORDER BY 3 DESC , 1 , 2;
