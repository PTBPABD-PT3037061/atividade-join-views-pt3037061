/* ===================================
   QUESTÃO 01
   =================================== */
-- Crie uma relação a partir da união das tabelas student e takes.

SELECT s.*, t.course_id, t.sec_id, t.semester, t.year, t.grade
FROM student s
INNER JOIN takes t ON s.ID = t.ID
ORDER BY s.ID;

/* ===================================
   QUESTÃO 02
   =================================== */
-- Contar a quantidade de cursos realizados pelos alunos do departamento de Civil Eng.
-- Ordenar de maneira decrescente a quantidade de cursos associada aos alunos.

SELECT s.ID, s.name, COUNT(t.course_id) AS 'Quantidade de cursos'
FROM student s
LEFT JOIN takes t ON s.ID = t.ID
WHERE s.dept_name = 'Civil Eng'
GROUP BY s.ID, s.name
ORDER BY COUNT(t.course_id) DESC;

/* ===================================
   QUESTÃO 03
   =================================== */
-- Criar uma view chamada 'civil_eng_students' a partir da relação construída na Questão 2.

CREATE VIEW civil_eng_students AS
SELECT s.ID, s.name, COUNT(t.course_id) AS 'Quantidade de cursos'
FROM student s
LEFT JOIN takes t ON s.ID = t.ID
WHERE s.dept_name = 'Civil Eng'
GROUP BY s.ID, s.name;
