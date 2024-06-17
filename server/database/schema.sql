-- MySQL Script generated by MySQL Workbench
-- Tue Jun 11 11:29:56 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema moovit
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `moovit` ;

-- -----------------------------------------------------
-- Schema moovit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `moovit` DEFAULT CHARACTER SET utf8 ;
USE `moovit` ;

-- -----------------------------------------------------
-- Table `moovit`.`competition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moovit`.`competition` ;

CREATE TABLE IF NOT EXISTS `moovit`.`competition` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `start_time` DATETIME NOT NULL,
  `details` LONGTEXT NULL,
  `adress` VARCHAR(255) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_training_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_training_user0`
    FOREIGN KEY (`user_id`)
    REFERENCES `moovit`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moovit`.`feedback`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moovit`.`feedback` ;

CREATE TABLE IF NOT EXISTS `moovit`.`feedback` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `duration` DATETIME NOT NULL,
  `global` ENUM('easy', 'medium', 'hard') NOT NULL,
  `difficulty` ENUM('easy', 'medium', 'hard') NOT NULL,
  `after` ENUM('tired', 'good', 'perfect') NOT NULL,
  `details` LONGTEXT NULL,
  `training_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_feedback_training1_idx` (`training_id` ASC) VISIBLE,
  CONSTRAINT `fk_feedback_training1`
    FOREIGN KEY (`training_id`)
    REFERENCES `moovit`.`training` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moovit`.`sport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moovit`.`sport` ;

CREATE TABLE IF NOT EXISTS `moovit`.`sport` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` ENUM('fitness', 'running') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moovit`.`template`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moovit`.`template` ;

CREATE TABLE IF NOT EXISTS `moovit`.`template` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `duration` DATETIME NULL,
  `details` LONGTEXT NULL,
  `user_id` INT NOT NULL,
  `sport_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_template_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_template_sport1_idx` (`sport_id` ASC) VISIBLE,
  CONSTRAINT `fk_template_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moovit`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_template_sport1`
    FOREIGN KEY (`sport_id`)
    REFERENCES `moovit`.`sport` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moovit`.`tip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moovit`.`tip` ;

CREATE TABLE IF NOT EXISTS `moovit`.`tip` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  `content` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `moovit`.`tip` (`type`, `content`) VALUES ('Entraînement', "Bois de l'eau tout au long de la journée pour éviter la déshydratation et consomme environ 500 ml d'eau 1 à 2 heures avant l'entraînement"),
('Entraînement', "Prends un repas équilibré 2 à 3 heures avant la séance, comprenant des glucides complexes, des protéines et des graisses saines. Si tu manges plus près de l'entraînement (30 à 60 minutes avant), opte pour une collation légère."),
('Entraînement', "Fais un échauffement dynamique pendant 5 à 10 minutes pour augmenter la température corporelle et préparer les muscles. Inclus des exercices comme des jumping jacks, des squats légers, et des mouvements spécifiques à votre sport."),
('Entraînement', "Assure toi que tu as les vêtements appropriés pour le sport pratiqué (chaussures, tenue confortable). Vérifie et prépare tout matériel nécessaire (bouteille d'eau, serviette, tapis de yoga, etc.)."),
('Entraînement', "Fixe des objectifs clairs pour la séance. Pratique des techniques de relaxation ou de respiration pour réduire le stress et te concentrer."),
('Entraînement', "Reprends de l'eau immédiatement après l'entraînement pour compenser les pertes de fluides. Considère des boissons isotoniques si l'effort a été long et intense."),
('Entraînement', "Mange une collation riche en protéines et en glucides dans les 30 minutes après l'entraînement pour aider à la récupération musculaire. Prends un repas équilibré dans les 2 heures suivant la séance."),
('Entraînement', "Effectue des étirements statiques pour détendre les muscles et augmenter la flexibilité. Utilise un rouleau de massage pour réduire les tensions musculaires et favoriser la circulation sanguine."),
('Entraînement', "Accorde toi un temps de repos suffisant pour permettre à ton corps de récupérer. Dors suffisamment, car le sommeil est crucial pour la réparation musculaire et la récupération générale."),
('Entraînement', "Note tes performances et tes sensations après chaque séance pour ajuster tes futurs entraînements."),
('Repos', "Assure toi d'obtenir suffisamment de sommeil de qualité (7 à 9 heures par nuit), car c'est le moment où le corps récupère et se répare le mieux. Intègre des siestes courtes si nécessaire pour améliorer la récupération et réduire la fatigue."),
('Repos', "Maintiens une alimentation équilibrée et riche en nutriments pour soutenir la récupération. Consomme des aliments riches en protéines pour aider à la réparation musculaire, comme la viande maigre, le poisson, les œufs, et les légumineuses."),
('Repos', "Continue à boire suffisamment d'eau tout au long de la journée pour maintenir une bonne hydratation. Inclus des boissons riches en électrolytes si nécessaire pour aider à rétablir l'équilibre des minéraux."),
('Repos', "Pratique des activités légères comme la marche, la natation ou le vélo à un rythme modéré pour stimuler la circulation sanguine sans solliciter excessivement les muscles. Évite les activités intenses qui pourraient entraver la récupération."),
('Repos', "Écoute ton corps et ajuste les activités en fonction des signes de fatigue ou de douleur.");

-- -----------------------------------------------------
-- Table `moovit`.`training`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moovit`.`training` ;

CREATE TABLE IF NOT EXISTS `moovit`.`training` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `date` DATE NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `details` LONGTEXT NULL,
  `time_of_day` ENUM('morning', 'afternoon', 'evening') NULL,
  `is_completed` TINYINT NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_training_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_training_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `moovit`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moovit`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moovit`.`user` ;

CREATE TABLE IF NOT EXISTS `moovit`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `level` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moovit`.`user_has_sport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moovit`.`user_has_sport` ;

CREATE TABLE IF NOT EXISTS `moovit`.`user_has_sport` (
  `user_id` INT NOT NULL,
  `sport_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `sport_id`),
  INDEX `fk_user_has_sport_sport1_idx` (`sport_id` ASC) VISIBLE,
  INDEX `fk_user_has_sport_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_sport_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `moovit`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_sport_sport1`
    FOREIGN KEY (`sport_id`)
    REFERENCES `moovit`.`sport` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
