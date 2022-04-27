# comandos SQL

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
ALTER TABLE
```