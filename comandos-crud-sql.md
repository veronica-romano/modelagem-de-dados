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
--o banco crirá o autoincremet do id, então não podemos colocar aqui
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



````