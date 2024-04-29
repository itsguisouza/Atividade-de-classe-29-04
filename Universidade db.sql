-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Universidade
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Universidade
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Universidade` ;
USE `Universidade` ;

-- -----------------------------------------------------
-- Table `Universidade`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade`.`Professor` (
  `idProfessor` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `Idade` INT NULL,
  `Email` VARCHAR(45) NULL,
  `Curso_idCurso` INT NOT NULL,
  `Curso_Aluno_idAluno` INT NOT NULL,
  `Curso_Aluno_Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`idProfessor`, `Curso_idCurso`, `Curso_Aluno_idAluno`, `Curso_Aluno_Curso_idCurso`),
  INDEX `fk_Professor_Curso1_idx` (`Curso_idCurso` ASC, `Curso_Aluno_idAluno` ASC, `Curso_Aluno_Curso_idCurso` ASC),
  CONSTRAINT `fk_Professor_Curso1`
    FOREIGN KEY (`Curso_idCurso` , `Curso_Aluno_idAluno` , `Curso_Aluno_Curso_idCurso`)
    REFERENCES `Universidade`.`Curso` (`idCurso` , `Aluno_idAluno` , `Aluno_Curso_idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade`.`Curso` (
  `idCurso` INT NOT NULL AUTO_INCREMENT,
  `Nome_do_curso` VARCHAR(45) NULL,
  `Descricao` VARCHAR(45) NULL,
  `Quantidade_de_alunos` INT NULL,
  `Aluno_idAluno` INT NOT NULL,
  `Aluno_Curso_idCurso` INT NOT NULL,
  `Professor_idProfessor` INT NOT NULL,
  `Professor_Curso_idCurso` INT NOT NULL,
  `Professor_Curso_Aluno_idAluno` INT NOT NULL,
  `Professor_Curso_Aluno_Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`idCurso`, `Aluno_idAluno`, `Aluno_Curso_idCurso`, `Professor_idProfessor`, `Professor_Curso_idCurso`, `Professor_Curso_Aluno_idAluno`, `Professor_Curso_Aluno_Curso_idCurso`),
  INDEX `fk_Curso_Aluno1_idx` (`Aluno_idAluno` ASC, `Aluno_Curso_idCurso` ASC),
  INDEX `fk_Curso_Professor1_idx` (`Professor_idProfessor` ASC, `Professor_Curso_idCurso` ASC, `Professor_Curso_Aluno_idAluno` ASC, `Professor_Curso_Aluno_Curso_idCurso` ASC),
  CONSTRAINT `fk_Curso_Aluno1`
    FOREIGN KEY (`Aluno_idAluno` , `Aluno_Curso_idCurso`)
    REFERENCES `Universidade`.`Aluno` (`idAluno` , `Curso_idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_Professor1`
    FOREIGN KEY (`Professor_idProfessor` , `Professor_Curso_idCurso` , `Professor_Curso_Aluno_idAluno` , `Professor_Curso_Aluno_Curso_idCurso`)
    REFERENCES `Universidade`.`Professor` (`idProfessor` , `Curso_idCurso` , `Curso_Aluno_idAluno` , `Curso_Aluno_Curso_idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Universidade`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Universidade`.`Aluno` (
  `idAluno` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NULL,
  `data_de_nascimento` DATE NULL,
  `Email` VARCHAR(45) NULL,
  `Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`idAluno`, `Curso_idCurso`),
  INDEX `fk_Aluno_Curso_idx` (`Curso_idCurso` ASC),
  CONSTRAINT `fk_Aluno_Curso`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `Universidade`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
