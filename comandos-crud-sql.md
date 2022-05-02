# COMANDOS CRUD SQL

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
--consultar o banco de dados
### Ler dados da tabela produtos

``` sql
SELECT * FROM produtos; -- todos os itens em produtos
SELECT nome, preco FROM produtos; -- penas nome e preco em produtos
SELECT nome FROM produtos WHERE preco < 5000; -- o nome de produtos com preco menor que 5 mil
SELECT nome, descricao FROM produtos WHERE fabricante_id = 3; -- nome e descrição de todos os produtos da fabricante apple
```

### Operadores E OU NAO
``` sql
SELECT * FROM produtos WHERE preco >= 5000 AND preco < 8000; -- seleciona todos os produtos onde o preco é maior ou igual a 5 mil e menor de 8 mil em preco

SELECT nome, preco FROM produtos WHERE fabricante_id = 3 OR fabricante_id = 8;

-- função IN
SELECT nome, preco FROM produtos WHERE fabricante_id IN (3,8);

-- diferente de 
SELECT nome, preco, quantidade FROM produtos WHERE fabricante_id != 3;
-- não, exceto
SELECT nome, preco, quantidade FROM produtos WHERE NOT fabricante_id = 3;

```