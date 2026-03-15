
-- Questão 01. Crie uma relação a partir da união das tabelas student e takes.

-- Aqui foi só um join para unir as duas tabelas
SELECT *
FROM student s
JOIN takes t ON s.ID = t.ID;


-- Questão 2. Contar a quantidade de cursos realizados pelos alunos do departamento 
-- de Civil Eng. Ordenar de maneira descendente a quantidade de cursos.


-- Aqui eu usei o COUNT para pegar a quantidade e o ORDER BY com o DESC para ordenar na ordem q foi solicitada
SELECT 
    s.ID, 
    s.name, 
    COUNT(t.course_id) AS "Quantidade de cursos"
FROM student s
JOIN takes t ON s.ID = t.ID
WHERE s.dept_name = 'Civil Eng.'
GROUP BY s.ID, s.name
ORDER BY "Quantidade de cursos" DESC;




-- Questão 3. Criar uma view chamada 'civil_eng_students' a partir da relação 
-- construída na Questão 2.
-- Aqui eu só criei a view em cima do select da questão anterior

CREATE VIEW civil_eng_students AS
SELECT 
    s.ID, 
    s.name, 
    COUNT(t.course_id) AS "Quantidade de cursos"
FROM student s
JOIN takes t ON s.ID = t.ID
WHERE s.dept_name = 'Civil Eng.'
GROUP BY s.ID, s.name;

-- Para consultar essa view tem q o seu o seguinte select
-- SELECT * FROM civil_eng_students ORDER BY "Quantidade de cursos" DESC;