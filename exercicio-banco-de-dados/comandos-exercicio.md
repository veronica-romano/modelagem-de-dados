```sql

```

## Fase 1



Criando a base de dados:
``` sql
CREATE DATABASE tecinternet_escola_veronica CHARACTER SET utf8mb4;
```

Criando a entidade cursos:
``` sql
CREATE TABLE cursos(
    id SMALLINT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45) NOT NULL,
    carga SMALLINT NOT NULL,
    professor_id INT NULL
);
```

Chave estrangeira:
``` sql
ALTER TABLE cursos ADD CONSTRAINT fk_professor FOREIGN KEY (professor_id) REFERENCES professores(id);

```

Criando a entidade professores:
``` sql
CREATE TABLE professores(
    id SMALLINT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    area ENUM('desing', 'desenvolvimento', 'infra') NOT NULL,
    curso_id INT NULL
);
```

Chave estrangeira:
``` sql
ALTER TABLE professores ADD CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES cursos(id);

```

criando a entidade alunos:
``` sql
CREATE TABLE alunos(
    id SMALLINT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    nscimento DATE NOT NULL,
    nota1 DECIMAL(4,2) NOT NULL,
    nota2 DECIMAL(4,2) NOT NULL,
    curso_id SMALLINT NOT NULL
);
```

Chave estrangeira:
``` sql
ALTER TABLE alunos ADD CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES cursos(id);

```


## Fase 2

Inserindo cursos:
```sql
INSERT INTO cursos (titulo, carga) 
VALUES ('Front-End', 40);
```

inserindo professores:
```sql
INSERT INTO professores (nome, area, curso_id) 
VALUES ('Lemmy Kilmister', 'design', 4);
```

Associando cada professor ao curso:
```sql
UPDATE `cursos` SET `professor_id` = '4' WHERE `cursos`.`id` = 5;
```

Inserindo alunos:
```sql
INSERT INTO alunos (nome, nascimento, nota1, nota2, curso_id) 
VALUES ('Joan Jett', '1958-09-22' , 5.3, 6.5, 3);
```

Encontrando a média
```sql
SELECT nome, curso,((nota1 + nota2)/2) AS "Média: " FROM alunos;
```

## Fase 3

