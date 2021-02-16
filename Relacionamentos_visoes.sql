USE curso_sql;

SELECT * FROM funcionarios;
SELECT * FROM veiculos;

SELECT * FROM funcionarios INNER JOIN veiculos ON funcionario_id = funcionarios.id;
SELECT * FROM funcionarios f INNER JOIN veiculos v ON v.funcionario_id = f.id;

SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id;
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (NULL, "moto", "SB-0003");

SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

CREATE TABLE cpf
 (
    id INT UNSIGNED NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES funcionarios (id)
);

INSERT INTO cpf (id, cpf) VALUES (1,'111.111.111-11');
INSERT INTO cpf (id, cpf) VALUES (2,'222.222.222-22');
INSERT INTO cpf (id, cpf) VALUES (3,'333.333.333-33');
INSERT INTO cpf (id, cpf) VALUES (5,'555.555.555-55');

SELECT * FROM cpf;

SELECT * FROM funcionarios INNER JOIN cpf ON funcionarios.id = cpf.id;
SELECT * FROM funcionarios INNER JOIN cpf USING (id);


CREATE TABLE clientes
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    quem_indicou int unsigned, 
    primary key (id),
    CONSTRAINT fk_quem_indicou foreign key (quem_indicou) REFERENCES clientes (id)
);

INSERT INTO clientes (id, nome, quem_indicou) VALUES (1, 'André', NULL);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2, 'Samuel', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3, 'Carlos', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4, 'Rafael', 1); 

SELECT * FROM clientes;

SELECT a.nome AS CLIENTE, b.nome AS "QUEM_INDICOU" FROM clientes a join clientes b ON a.quem_indicou = b.id;

SELECT * FROM funcionarios f 
INNER JOIN veiculos v ON v.funcionario_id = f.id 
INNER JOIN cpf ON cpf.id = f.id;

CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 1700;
SELECT * FROM funcionarios_a;
UPDATE funcionarios SET salario = 1500 WHERE id = 3;
