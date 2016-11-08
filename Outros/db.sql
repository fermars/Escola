DROP DATABASE IF EXISTS TCC_Escola;
CREATE DATABASE TCC_Escola;
USE TCC_Escola;

CREATE TABLE Curso (
	cod INT PRIMARY KEY,
	nome VARCHAR(20)
);

-- CREATE TABLE Sala (
-- 	num INT PRIMARY KEY,
--   periodo ENUM('M', 'T', 'N') PRIMARY KEY, /*Manhã, tarde, noite*/
-- 	curso INT,
-- 	FOREIGN KEY(curso) REFERENCES Curso(cod)
-- );

CREATE TABLE Materia (
	cod INT PRIMARY KEY,
	nome VARCHAR(20)
);

CREATE TABLE Professor (
	cod INT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	genero ENUM('M', 'F', 'O'),
	nascimento DATE,
	email VARCHAR(45),
	senha VARCHAR(32)
);

CREATE TABLE Aluno (
	matricula INT PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	genero ENUM('M', 'F', 'O'),
	nascimento DATE,
	curso INT,
	ano INT,
	sala INT,
	FOREIGN KEY(curso) REFERENCES Curso(cod)
);

CREATE TABLE Aula (
	id INT PRIMARY KEY,
	horario TIME,     -- 1 ~ 5
	sala INT,   	 		-- x ~ y
	professor INT,  	-- x ~ y
	diaSemana INT(1), -- 0 ~ 6
	-- FOREIGN KEY(sala) REFERENCES Sala(num),
	FOREIGN KEY(professor) REFERENCES Professor(cod),
	UNIQUE KEY AulaUniqueKey (horario, sala, professor, diaSemana)
);

CREATE TABLE Avaliacao (
	id INT PRIMARY KEY,
	aula INT,
	data DATE,
	desc TINYTEXT,
	FOREIGN KEY(professor) REFERENCES Professor(cod)
);
