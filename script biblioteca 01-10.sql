-- EXERCÍCIO 01/10

CREATE DATABASE db_biblio;
USE db_biblio;

CREATE TABLE tb_autor(
	id_autor_pk	INT PRIMARY KEY AUTO_INCREMENT,
    nome		VARCHAR(100) NOT NULL,
    idade		INT
);

INSERT INTO tb_autor (nome, idade) VALUES ('Shakespeare', 462);
INSERT INTO tb_autor (nome, idade) VALUES ('Machadinho', 187);

CREATE TABLE tb_livro(
	ISBN_pk		VARCHAR(13) PRIMARY KEY,
    ano			VARCHAR(10),
    titulo		VARCHAR(200),
    autor_fk	INT,
    CONSTRAINT autor_fk FOREIGN KEY (autor_fk) REFERENCES tb_autor(id_autor_pk)
);

INSERT INTO tb_livro (ISBN_pk, ano, titulo) VALUES ('9785669874110', 1603, 'Hamlet');
INSERT INTO tb_livro (ISBN_pk, ano, titulo) VALUES ('9788996554122', 1597, 'Romeu e Julieta');
INSERT INTO tb_livro (ISBN_pk, ano, titulo) VALUES ('9785669872230', 1899, 'Dom Casmurro');
INSERT INTO tb_livro (ISBN_pk, ano, titulo) VALUES ('9788988854122', 1881, 'O Alienista');

CREATE TABLE tb_aluno(
	CPF_pk		VARCHAR(11) PRIMARY KEY,
	nome		VARCHAR(100) NOT NULL,
    telefone	VARCHAR(11),
    email		VARCHAR(100)
);
INSERT INTO tb_aluno (CPF_pk, nome, telefone, email) VALUES ('44599987785', 'Hulda', '11984555220', 'hulda@email.com');
INSERT INTO tb_aluno (CPF_pk, nome, telefone, email) VALUES ('22399987785', 'Shunamite', '11989995220', 'shuna@email.com');
INSERT INTO tb_aluno (CPF_pk, nome, telefone, email) VALUES ('08599987785', 'Agnes', '11974445220', 'agnes@email.com');
INSERT INTO tb_aluno (CPF_pk, nome, telefone, email) VALUES ('33099987785', 'Nick', '11980021220', 'nick@email.com');
INSERT INTO tb_aluno (CPF_pk, nome, telefone, email) VALUES ('96544987785', 'Fred', '11984500320', 'fred@email.com');

CREATE TABLE tb_emprestimo(
	id_emp_pk			INT PRIMARY KEY AUTO_INCREMENT,
	dataemprestimo		DATE,
    dataprevistadevol	DATE,
    dataefetivadevol	DATE,
    aluno_fk			VARCHAR(11),
    livro_fk			VARCHAR(13),
	CONSTRAINT aluno_fk FOREIGN KEY (aluno_fk) REFERENCES tb_aluno(CPF_pk),
    CONSTRAINT livro_fk FOREIGN KEY (livro_fk) REFERENCES tb_livro(ISBN_pk)
);
INSERT INTO tb_emprestimo (dataemprestimo, dataprevistadevol, dataefetivadevol, aluno_fk, livro_fk)
VALUES ('2026-08-29', '2026-09-19', NULL, '22399987785', '9788996554122');
INSERT INTO tb_emprestimo (dataemprestimo, dataprevistadevol, dataefetivadevol, aluno_fk, livro_fk)
VALUES ('2026-09-03', '2026-09-23', '2026-09-22', '33099987785', '9785669874110');
INSERT INTO tb_emprestimo (dataemprestimo, dataprevistadevol, dataefetivadevol, aluno_fk, livro_fk)
VALUES ('2026-10-01', '2026-10-21', NULL, '44599987785', '9788988854122');

-- apenas quem fez empréstimo:
SELECT tb_aluno.nome, tb_livro.titulo, tb_emprestimo.dataemprestimo, tb_emprestimo.dataprevistadevol, tb_emprestimo.dataefetivadevol
FROM tb_emprestimo INNER JOIN tb_aluno ON tb_emprestimo.aluno_fk = tb_aluno.CPF_pk INNER JOIN tb_livro ON tb_emprestimo.livro_fk = tb_livro.ISBN_pk;

-- mostrando todos os alunos:
SELECT tb_aluno.nome, tb_livro.titulo, tb_emprestimo.dataemprestimo, tb_emprestimo.dataprevistadevol, tb_emprestimo.dataefetivadevol
FROM tb_aluno LEFT JOIN tb_emprestimo ON tb_aluno.CPF_pk = tb_emprestimo.aluno_fk LEFT JOIN tb_livro ON tb_emprestimo.livro_fk = tb_livro.ISBN_pk;

-- ALTER TABLE tb_emprestimo ADD COLUMN id_emprestimo INT PRIMARY KEY AUTO_INCREMENT;

SHOW TABLES;
SELECT*FROM tb_aluno;
SELECT*FROM tb_emprestimo;
SELECT*FROM tb_autor;
SELECT*FROM tb_livro;

-- ALTER TABLE tb_autor ADD COLUMN autor_fk INT;
-- ALTER TABLE tb_autor DROP COLUMN autor_fk;

-- ALTER TABLE tb_emprestimo ADD COLUMN autor_fk INT;
/*
DROP TABLE tb_emprestimo;
DROP TABLE tb_aluno;
DROP TABLE tb_livro;
DROP TABLE tb_autor;
*/  