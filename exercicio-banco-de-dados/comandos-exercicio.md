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

Alterando professor_id para not null
```sql
ALTER TABLE `cursos` CHANGE `professor_id` `professor_id` INT(11) NOT NULL;

```


## Fase 3

ordenando alunos por nascimento:
```sql
SELECT nome, nascimento FROM alunos ORDER BY nascimento;
```


1) consulta que mostre os alunos que nasceram antes do ano 2009
```sql
SELECT * FROM alunos WHERE nascimento < '2009-01-01';
```


2) consulta que calcula a média das notas de cada aluno e as mostra com duas casas decimais.
```sql
SELECT nome, ROUND(AVG((nota1 + nota2)/2), 2) AS media FROM alunos GROUP BY id;
```


3) consulta que calcule o limite de faltas de cada curso de acordo com a carga horária. Considerando o limite como 25% da carga horária. Classificando em ordem crescente pelo título do curso.
```sql
SELECT titulo, carga, ROUND(carga * 0.25) AS 'limite' FROM cursos ORDER BY titulo;
```


4) consulta que mostra os nomes somente dos professores da área de desenvolvimento.
```sql
SELECT nome FROM professores WHERE area = 'desenvolvimento';
SELECT * FROM professores WHERE area = 'desenvolvimento';
```


5) consulta que mostra a quantidade de professores por área de desenvolvimento.
```sql
SELECT COUNT(id) AS 'quantidade' FROM professores WHERE area = 'desenvolvimento';
```


6) consulta que mostra o nome dos alunos, o título e a carga horária dos cursos que fazem.
```sql
SELECT alunos.nome, cursos.titulo, cursos.carga FROM alunos LEFT JOIN cursos ON alunos.curso_id = cursos.id ORDER BY alunos.nome;
```


7) consulta que mostra o nome dos professores e o título do curso que lecionam. Classificando pelo nome do professor.
```sql
SELECT professores.nome, cursos.titulo FROM professores LEFT JOIN cursos ON professores.curso_id = cursos.id ORDER BY professores.nome;
```


8)consulta que mostra o nome dos alunos, o título dos cursos que fazem, e o professor de cada curso.
```sql
SELECT alunos.nome, cursos.titulo, professores.nome FROM alunos LEFT JOIN cursos ON alunos.curso_id = cursos.id LEFT JOIN professores ON professores.curso_id = cursos.id;
```
9)consulta que mostre a quantidade de alunos que cada curso possui. Resultados em ordem descrecente de acordo com a quantidade de alunos.
```sql
SELECT cursos.titulo AS `curso`, COUNT(alunos.curso_id) AS `quantidade` FROM alunos LEFT JOIN CURSOS ON alunos.curso_id = cursos.id GROUP BY curso ORDER BY `quantidade` DESC;
```


10) Faça uma consulta que mostre o nome dos alunos, suas notas, médias, e o título dos cursos que fazem. Devem ser considerados somente os alunos de Front-End e Back-End. Mostre classificados pelo nome do aluno.
```sql
SELECT alunos.nome, alunos.nota1, alunos.nota2, ROUND(((alunos.nota1 + alunos.nota2)/2), 2) AS `media`, professores.nome FROM alunos LEFT JOIN cursos ON alunos.curso_id = cursos.id LEFT JOIN professores ON professores.curso_id = cursos.id WHERE cursos.id = 1 OR cursos.id = 2;
```


11) Consulta que altera o nome do curso Figma para Adobe XD e a carga horária de 10 para 15.
```sql
UPDATE cursos SET titulo = 'Adobe XD', carga = 15 WHERE id = 4;
```


12) Consulta que exclua um aluno do curso de Redes de Computadores e um aluno do curso de UX/UI.
```sql
--confirmar os alunos com select: 
SELECT  nome, id, curso_id FROM alunos WHERE curso_id = 3 OR curso_id = 5 ;
SELECT nome FROM alunos WHERE id = 6 OR id = 5;

--deletar os alunos encontrados:
DELETE FROM alunos WHERE id = 6 OR id = 5;
```


13) Consulta que mostra a lista de alunos atualizada e o título dos cursos que fazem, classificados pelo nome do aluno.
```sql
SELECT alunos.nome AS `Alunos`, cursos.titulo AS `Cursos` FROM alunos LEFT JOIN CURSOS ON alunos.curso_id = cursos.id group by alunos;
```

## Desafio

Encontrando a idade dos alunos:

```sql
SELECT nome AS `Aluno`, TIMESTAMPDIFF(YEAR, nascimento, CURDATE()) AS `Idade` FROM alunos;
```

Encontrando a média
```sql
SELECT nome, ROUND(((nota1 + nota2)/2), 2) AS `Média` FROM alunos;
```

Encontrando a média das notas de cada aluno mostrando alunos que tiveram a média maior ou igual a 7.
```sql
SELECT nome, ROUND(((nota1 + nota2)/2), 2) AS `media` FROM alunos WHERE ROUND(((nota1 + nota2)/2), 2) >= 7.0 ;
```
Encontrando a média das notas de cada aluno mostrando alunos que tiveram a média menor que 7.
```sql
SELECT nome, ROUND(((nota1 + nota2)/2), 2) AS `media` FROM alunos WHERE ROUND(((nota1 + nota2)/2), 2) < 7.0 ;
```
Encontrando a quantidade de alunos com média maior ou igual a 7.
```sql
SELECT COUNT(id) FROM alunos WHERE ROUND(((nota1 + nota2)/2), 2) >= 7.0;

SELECT COUNT(id) AS `quantidade de alunos com nota maior ou igual a 7` FROM alunos WHERE ROUND(((nota1 + nota2)/2), 2) >= 7.0 ;
```

