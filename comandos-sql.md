# COMANDOS SQL

## Modelagem física

## Criar o banco de dados
``` sql
CREATE DATABASE vendas CHARACTER SET utf8mb4;
```

## Criar a tabela fabricantes
``` sql
CREATE TABLE fabricantes(
    id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
) ;
```

## Visualizar detalhes estruturais da tabela
``` sql
DESC fabricantes;
```
## Criar a tabela produtos
``` sql
CREATE TABLE produtos(
    id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    descricao TEXT(1000) NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    fabricante_id INT NOT NULL
) 
```

## Visualizar detalhes estruturais da tabela
``` sql
DESC produtos;
```

## Criação da chave estrangeira (relacionamento entre tabelas)

``` sql
 --constraint é um descrição definida no relacionamento--
ALTER TABLE produtos ADD CONSTRAINT fk_produtos_fabricantes FOREIGN KEY (fabricante_id) REFERENCES fabricantes(id);

```