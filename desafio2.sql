USE SpotifyClone;
CREATE VIEW estatisticas_musicais AS SELECT
(SELECT COUNT(musica_id) FROM musica) AS cancoes,
(SELECT COUNT(artista_id) FROM artista) AS artistas,
(SELECT COUNT(album_id) FROM albums) AS albuns;
