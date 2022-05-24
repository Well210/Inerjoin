CREATE DATABASE db_pizzaria_legal;


USE db_pizzaria_legal;

CREATE TABLE tb_categoria(
id BIGINT AUTO_INCREMENT,
borda CHAR,
refrigerante CHAR,
sobremesa CHAR,
azeitona CHAR,
PRIMARY KEY (id)
);

INSERT INTO tb_categoria (borda, refrigerante, sobremesa,azeitona) values('S','N','S','S');
INSERT INTO tb_categoria (borda, refrigerante, sobremesa,azeitona) values('N','S','S','S');
INSERT INTO tb_categoria (borda, refrigerante, sobremesa,azeitona) values('N','N','S','S');
INSERT INTO tb_categoria (borda, refrigerante, sobremesa,azeitona) values('S','S','N','S');
INSERT INTO tb_categoria (borda, refrigerante, sobremesa,azeitona) values('S','N','N','S');
INSERT INTO tb_categoria (borda, refrigerante, sobremesa,azeitona) values('S','S','N','S');
INSERT INTO tb_categoria (borda, refrigerante, sobremesa,azeitona) values('S','S','S','S');
INSERT INTO tb_categoria (borda, refrigerante, sobremesa,azeitona) values('N','N','N','S');

CREATE TABLE tb_pizza(
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
ingredientes VARCHAR(255) NOT NULL,
preco DECIMAL(8,2) NOT NULL,
desconto BOOLEAN,
categoria_id BIGINT,
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

INSERT INTO tb_pizza (nome, ingredientes, preco, desconto, categoria_id) VALUES("Margherita", "Molho de tomate Italiano, mussarela fatiada, tomate, parmesão, orégano, manjericão e azeitonas verdes sem caroço.", 45.00, FALSE, 1);
INSERT INTO tb_pizza (nome, ingredientes, preco, desconto, categoria_id) VALUES("Contadina", "Molho de tomate Italiano, mussarela fatiada, antepasto de berinjela, abobrinha, tomate cereja, gorgonzola, orégano e alho poró.", 60.00, FALSE, 2);
INSERT INTO tb_pizza (nome, ingredientes, preco, desconto, categoria_id) VALUES("Fiorella", "Molho de tomate Italiano, mussarela fatiada, abobrinha, brie, tomates cereja, parmesão e orégano.", 35.00, FALSE, 3);
INSERT INTO tb_pizza (nome, ingredientes, preco, desconto, categoria_id) VALUES("Gênova", "Molho de tomate Italiano, presunto, brócolis, requeijão, orégano, alho frito e azeitonas verdes sem caroço.", 30.00, FALSE, 4);
INSERT INTO tb_pizza (nome, ingredientes, preco, desconto, categoria_id) VALUES("Giuseppe", "Massa de pizza sem glúten/vegana, molho de tomate Italiano, requeijão vegano, brócolis, ervilhas, tomate, cebola, orégano, alho frito e azeitonas pretas.", 55.00, false, 5);
INSERT INTO tb_pizza (nome, ingredientes, preco, desconto, categoria_id) VALUES("Corniccione Toscano", "Fina massa Bella Capri, molho de tomate Italiano, alho laminado, gorgonzola, parmesão, azeitonas pretas e orégano.", 29.00, FALSE, 5);

DELETE FROM tb_pizza WHERE id = 7;
SELECT * FROM tb_pizza;
SELECT tb_pizza.nome, tb_pizza.ingredientes, tb_pizza.preco, tb_pizza.desconto, tb_categoria.borda, tb_categoria.refrigerante, tb_categoria.sobremesa from tb_pizza inner join tb_categoria on tb_categoria.id = tb_pizza.categoria_id where preco > 45;

SELECT tb_pizza.nome, tb_pizza.ingredientes, tb_pizza.preco, tb_pizza.desconto, tb_categoria.borda, tb_categoria.refrigerante, tb_categoria.sobremesa from tb_pizza inner join tb_categoria on tb_categoria.id = tb_pizza.categoria_id where preco between 29 and 60;

SELECT * FROM tb_pizza WHERE nome LIKE "%C%";

SELECT tb_pizza.nome, tb_pizza.ingredientes, tb_pizza.preco, tb_pizza.desconto, tb_categoria.borda, tb_categoria.refrigerante, tb_categoria.sobremesa from tb_pizza inner join tb_categoria on tb_categoria.id = tb_pizza.categoria_id where refrigerante = 'S';