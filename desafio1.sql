CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`artista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`artista` ;
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(80) NOT NULL,
  CONSTRAINT PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`albums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`albums` ;
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albums` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `artista_id_idx` (`artista_id` ASC),
  CONSTRAINT `artista_id`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`musica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`musica` ;
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`musica` (
  `musica_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(200) NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`musica_id`),
  INDEX `album_id_idx` (`album_id` ASC),
  CONSTRAINT `album_id`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`albums` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`plano`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`plano` ;
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `plano_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(45) NOT NULL,
  `preco` DECIMAL(4,2) NOT NULL
)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`usuario` ;
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(200) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  INDEX `plano_id_idx` (`plano_id` ASC),
  CONSTRAINT `plano_id`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`plano` (`plano_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`historico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`historico` ;
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico` (
  `usuario_id` INT NOT NULL,
  `musica_id` INT NOT NULL,
  PRIMARY KEY (`musica_id`, `usuario_id`),
  INDEX `musica_id_idx` (`musica_id` ASC),
  CONSTRAINT `usuario_id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `musica_id`
    FOREIGN KEY (`musica_id`)
    REFERENCES `SpotifyClone`.`musica` (`musica_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuario_artista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`usario_artista` ;
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario_artista` (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  INDEX `artista_id_idx` (`artista_id` ASC),
  CONSTRAINT PRIMARY KEY (`usuario_id`, `artista_id`),
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artista` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Inserindo dados na tabela artista
INSERT INTO `SpotifyClone`.`artista` (`nome`)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

-- Inserindo dados na tabela albums
INSERT INTO `SpotifyClone`.`albums` (`nome`, `artista_id`)
VALUES
  ('Envious', (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Walter Phoenix')),
  ('Exuberant', (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Walter Phoenix')),
  ('Hallowed Steam', (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Peter Strong')),
  ('Incandescent', (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Lance Day')),
  ('Temporary Culture', (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Freedie Shannon'));

-- Inserindo dados na tabela musica
INSERT INTO `SpotifyClone`.`musica` (`nome`, `album_id`)
VALUES
  ('Soul For Us', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Envious')),
  ('Reflections Of Magic', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Envious')),
  ('Dance With Her Own', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Envious')),
  ('Troubles Of My Inner Fire', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Exuberant')),
  ('Time Fireworks', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Exuberant')),
  ('Magic Circus', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Hallowed Steam')),
  ('Honey, So Do I',(SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Hallowed Steam')),
  ('Sweetie, Let''s Go Wild', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Hallowed Steam')),
  ('She Knows', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Hallowed Steam')),
  ('Fantasy For Me', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Incandescent')),
  ('Celebration Of More', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Incandescent')),
  ('Rock His Everything', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Incandescent')),
  ('Home Forever', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Incandescent')),
  ('Diamond Power', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Incandescent')),
  ('Honey, Let''s Be Silly', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Incandescent')),
  ('Thang Of Thunder', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Temporary Culture')),
  ('Words Of Her Life', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Temporary Culture')),
  ('Without My Streets', (SELECT album_id FROM SpotifyClone.albums WHERE nome = 'Temporary Culture'));

-- Inserindo dados na tabela plano
INSERT INTO `SpotifyClone`.`plano` (`nome`, `preco`)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universit??rio', 5.99);

-- Inserindo dados na tabela usuario
INSERT INTO `SpotifyClone`.`usuario` (`nome`, `idade`, `plano_id`)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

-- Inserindo dados na tabela historico
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`,`musica_id`)
VALUES
  (1, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Soul For Us')),
  (1, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Magic Circus')),
	(1, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Diamond Power')),
  (1, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Thang Of Thunder')),
	(2, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Home Forever')),
  (2, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Words Of Her Life')),
  (2, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Reflections Of Magic')),
  (2, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Honey, Let''s Be Silly')),
  (3, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Troubles Of My Inner Fire')),
  (3, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Thang Of Thunder')),
  (3, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Magic Circus')),
  (4, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Dance With Her Own')),
	(4, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Without My Streets')),
  (4, (SELECT musica_id FROM SpotifyClone.musica WHERE nome = 'Celebration Of More'));

-- Inserindo dados na tabela usuario_artista
INSERT INTO `SpotifyClone`.`usuario_artista` (`usuario_id`,`artista_id`)
VALUES
  (1, (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Walter Phoenix')),
  (1, (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Freedie Shannon')),
  (1, (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Lance Day')),
  (2, (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Walter Phoenix')),
  (2, (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Lance Day')),
  (3, (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Peter Strong')),
  (3, (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Walter Phoenix')),
  (4, (SELECT artista_id FROM SpotifyClone.artista WHERE nome = 'Freedie Shannon'));
