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
    nome VARCHAR(45) NOT NULL
) ;
```

## Visualizar detalhes estruturais da tabela
``` sql
DESC fabricantes;
```