# COMANDOS CRUD SQL

## Resumo

- C - Create (inserir dados)
- R - Read (ler dados)
- U - Updade (atualiar dados)
- D - Delete (excluir dados)

## INSERT
``` sql
--o banco crirá o autoincremet do id, então não podemos colocar aqui
INSERT INTO fabricantes (nome) VALUES('Asus');
INSERT INTO fabricantes (nome) VALUES ('Dell');
-- Inserirndo vários de uma vez:

INSERT INTO fabricantes (nome) VALUES ('Dell'), ('Apple'), ('LG'), ('Samsung'), ('Brastemp');


````