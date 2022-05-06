# COMANDOS CRUD SQL
Executar com CTRL + SHIFT + ENTER

## Resumo

- C - Create (inserir dados)
- R - Read (ler dados)
- U - Updade (atualiar dados)
- D - Delete (excluir dados)

## INSERT 
### Fabricantes
``` sql
--o banco crirá o autoincremet do id, então não podemos colocar aqui
INSERT INTO fabricantes (nome) VALUES('Asus');
INSERT INTO fabricantes (nome) VALUES ('Dell');
-- Inserirndo vários de uma vez:

INSERT INTO fabricantes (nome) VALUES ('Dell'), ('Apple'), ('LG'), ('Samsung'), ('Brastemp');
```
### Produtos
``` sql

INSERT INTO produtos (nome, descricao, preco, quantidade, fabricante_id) 
VALUES (
    'Ultrabook',
    'Intel Ultrabook Asus com processador Intel cORE i12, memória RAM de 16GB e Windows 11',
    6500.99,
    7,
    1 --id que consta no banco de dados
);

INSERT INTO produtos (nome, descricao, preco, quantidade, fabricante_id) 
VALUES (
    'Tablet Android',
    'Tablet comum versão 12 do sistema operacional da google. Possui tela de 10 polegadas e armazenamento de 64GB',
    4999.99,
    4,
    5 
);
```

``` sql
-- inserindo múltiplos valores
INSERT INTO produtos (nome, descricao, preco, quantidade, fabricante_id) 
VALUES 
(
    'Geladeira',
    'Refrigerador frost-free com acesso à internet das coisas e bla bla bla',
    1500,
    10,
    6 
),
(
    'iphone 13 Pro Max',
    'Alta durabilidade, processador Bionic 14 memória de 128GB de rmazenamento e 6GB de RAM e caro pra caramba',
    6999.99,
    3,
    3 
),
(
    'iPad Mini',
    'Tablet apple com tela retina display de 4k e memória interna de 64GB e acesso gratuito ao iCloud',
    5000,
    8,
    3 
);
```
## SELECT
consultar o banco de dados
### Ler dados da tabela produtos

``` sql
-- todos os itens em produtos
SELECT * FROM produtos; 
-- penas nome e preco em produtos
SELECT nome, preco FROM produtos; 
-- o nome de produtos com preco menor que 5 mil
SELECT nome FROM produtos WHERE preco < 5000; 
-- nome e descrição de todos os produtos da fabricante apple
SELECT nome, descricao FROM produtos WHERE fabricante_id = 3; 
```

### Operadores E OU NAO
``` sql
-- seleciona todos os produtos onde o preco é maior ou igual a 5 mil e menor de 8 mil em preco
SELECT * FROM produtos WHERE preco >= 5000 AND preco < 8000; 

SELECT nome, preco FROM produtos WHERE fabricante_id = 3 OR fabricante_id = 8;

-- função IN
SELECT nome, preco FROM produtos WHERE fabricante_id IN (3,8);

-- diferente de 
SELECT nome, preco, quantidade FROM produtos WHERE fabricante_id != 3;

-- não, exceto
SELECT nome, preco, quantidade FROM produtos WHERE NOT fabricante_id = 3;
```
### Filtros

``` sql
-- ordem A a Z
SELECT nome, preco FROM produtos ORDER BY nome;
-- ordem Z a A
SELECT nome, preco FROM produtos ORDER BY nome DESC;
-- encontrar na produtos que contenham a palavra 'processador' na descrição.  O operador %% é um operador coringa que significa qualquer texto
SELECT nome, descricao FROM produtos WHERE descricao LIKE '%processador%';
```

### Operadores e funções de agregação
``` sql
-- A soma dos preços de todos os produtos (sem levar consideração o estoque)
SELECT SUM(preco) FROM produtos;
-- Mostra a soma dos preços com o título(apelido, ALIAS) de 'total'
SELECT SUM(preco) AS TOTAL FROM produtos;
-- Mostra a soma das quantidades com o título de 'Quantidade em estoque'
SELECT SUM(quantidade) AS "Quantidade em estoque: " FROM produtos;
-- Mostra a soma das quantidades com o título de 'Quantidade em estoque' somente de produtos apple
SELECT SUM(quantidade) AS "Quantidade em estoque: " FROM produtos WHERE fabricante_id = 3;
-- Mostra a média dos preços dos produtos (sem levar consideração o estoque)
SELECT AVG(preco) AS "Média de preços: " FROM produtos;
-- Mostra a média arredondada dos preços dos produtos (sem levar consideração o estoque)
SELECT ROUND(AVG(preco)) AS "Média de preços: " FROM produtos;
-- Mostra a média arredondada dos preços dos produtos (sem levar consideração o estoque) com 2 casas decimais
SELECT ROUND(AVG(preco), 2) AS "Média de preços: " FROM produtos;
-- conta quantos produtos existem
SELECT COUNT(id) AS "Quantidade de produtos" FROM produtos;
-- conta quantos fabricantes existem na tabela (não ignorando os repetidos, resultando na mesma quantidade de produtos)
SELECT COUNT(fabricante_id) AS "Quantidade de fabricantes" FROM produtos;
-- conta quantos fabricantes existem na tabela ignorando os repetidos
SELECT COUNT(DISTINCT fabricante_id) AS "Quantidade de fabricantes" FROM produtos;
-- calcula o total do preco de acordo com a quantidade
SELECT nome, preco, quantidade, (preco * quantidade) AS total FROM produtos; 
```
### Agrupamentos
``` sql
-- a soma dos preços agrupados
SELECT SUM(preco) AS TOTAL FROM produtos GROUP BY fabricante_id;

--soma dos preços agrupados com id do fabricante
SELECT fabricante_id, SUM(preco) AS TOTAL FROM produtos GROUP BY fabricante_id;
```

## UPDATE
Atualizar o banco de dados de uma tabela

Sempre com WHERE

``` sql
-- atualiza o nome do fabricante id = 8 de 'Microsoft' para 'microsoft brasil'
UPDATE fabricantes SET nome = 'Microsoft Brasil' WHERE id = 8;
-- mudar o preco do ultrabook positivo para 5200
UPDATE produtos SET preco = 5200 WHERE id = 7;
-- mudar a quantidade dos produtos da asus E da apple para 15
UPDATE produtos SET quantidade = 15 WHERE fabricante_id = 1 OR fabricante_id =  3;
```

## DELETE
Excluir dados de uma tabela

Sempre com WHERE

``` sql
-- excluir o fabricante LG
DELETE FROM fabricantes WHERE id = 4;
-- os outros id's não sofrem alteração ou realocação
-- como o padrão on delete está como 'restrict', não podemos deletar o fabricante que tem produtos cadastrado
-- se o padrão fosse 'cascade', se excluiríam todos os produtos cadastrados com fabricante LG

-- excluir produtos com preco menor que 2000 e maior que 500
DELETE FROM produtos WHERE preco <= 2000 AND > 500;

--antes de deletar, fazer um comando select para ter certeza que é isso que precisamos fazer
SELECT nome FROM produtos WHERE preco <= 2000 AND preco > 500;
```

### Consulta em duas ou mais tabelas (JUNÇÃO)
``` sql
SELECT produtos.nome , fabricantes.nome  
```