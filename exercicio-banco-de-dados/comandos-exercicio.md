```sql

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

```

