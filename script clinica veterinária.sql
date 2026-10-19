CREATE DATABASE db_clinica;
USE db_clinica;

CREATE TABLE tb_cliente(
	id_cliente_pk	INT PRIMARY KEY AUTO_INCREMENT,
    nome			VARCHAR(100),
    telefone		VARCHAR(11)
);
INSERT INTO tb_cliente (nome, telefone) VALUES ('Harry Potter', '11744552258');
INSERT INTO tb_cliente (nome, telefone) VALUES ('Hermione Granger', '11996636258');
INSERT INTO tb_cliente (nome, telefone) VALUES ('Ronald Weasley', '11747772258');

SELECT * FROM tb_cliente;
SELECT * FROM tb_animal;
SELECT * FROM tb_consulta;

CREATE TABLE tb_animal(
	id_animal_pk	INT PRIMARY KEY AUTO_INCREMENT,
    nome			VARCHAR(100),
    raca			VARCHAR(50),
    cliente_fk		INT,
    CONSTRAINT cliente_fk FOREIGN KEY (cliente_fk) REFERENCES tb_cliente(id_cliente_pk)
);
INSERT INTO tb_animal (nome, raca) VALUES ('Sepúlveda', 'Fox Americano');
INSERT INTO tb_animal (nome, raca) VALUES ('Shunnamite', 'Labrador');
INSERT INTO tb_animal (nome, raca) VALUES ('João', 'Fox Americano');
INSERT INTO tb_animal (nome, raca) VALUES ('Rajado', 'Vira-lata');

UPDATE tb_animal SET cliente_fk = 1 WHERE id_animal_pk = 3;
UPDATE tb_animal SET cliente_fk = 2 WHERE id_animal_pk = 1;
UPDATE tb_animal SET cliente_fk = 3 WHERE id_animal_pk = 4;
UPDATE tb_animal SET cliente_fk = 1 WHERE id_animal_pk = 2;


CREATE TABLE tb_consulta(
	id_consulta_pk	INT PRIMARY KEY AUTO_INCREMENT,
    data_consulta	DATE,
    motivo			VARCHAR(500),
    animal_fk		INT,
    CONSTRAINT animal_fk FOREIGN KEY (animal_fk) REFERENCES tb_animal(id_animal_pk)
);
INSERT INTO tb_consulta (data_consulta, motivo, animal_fk) VALUES ('2026-10-15', 'Nunca foi ao veterinário', 3);
INSERT INTO tb_consulta (data_consulta, motivo, animal_fk) VALUES ('2026-10-19', 'Checkup', 3);
INSERT INTO tb_consulta (data_consulta, motivo, animal_fk) VALUES ('2026-11-01', 'Capeta no corpo', 4);
INSERT INTO tb_consulta (data_consulta, motivo, animal_fk) VALUES ('2026-11-07', 'Muito espirro', 1);
INSERT INTO tb_consulta (data_consulta, motivo, animal_fk) VALUES ('2026-12-10', 'Muita pulga', 2);

SELECT tb_cliente.nome, tb_animal.nome, tb_consulta.data_consulta, tb_consulta.motivo
FROM tb_cliente INNER JOIN tb_animal ON tb_animal.cliente_fk = tb_cliente.id_cliente_pk INNER JOIN tb_consulta ON tb_consulta.animal_fk = tb_animal.id_animal_pk;

SELECT tb_cliente.nome, tb_animal.nome
FROM tb_cliente LEFT JOIN tb_animal ON tb_animal.cliente_fk = tb_cliente.id_cliente_pk;



-- DROP DATABASE db_clinica;