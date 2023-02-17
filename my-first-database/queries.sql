--Média das notas da disciplina de AEDII
SELECT id
FROM disciplinas
WHERE nome LIKE 'Algoritmos%II';
--ACH2024
SELECT AVG(nota)
FROM disciplinas_alunos
WHERE disciplina_id = 'ACH2024';
--Resposta: 2,52

--A maior nota na disciplina de IAA
SELECT id
FROM disciplinas
WHERE nome LIKE '%Algoritmos'
--ACH2002
SELECT disciplinas_alunos.alunos_nusp, alunos.nome, nota
FROM disciplinas_alunos, alunos
WHERE disciplinas_alunos.alunos_nusp = alunos.id 
AND disciplina_id = 'ACH2002'
GROUP BY 1, 2, 3
ORDER BY 3 DESC;
--Resposta: 8,9

--Quantos alunos ficaram de recuperação no semestre (3 <= n < 5)
SELECT COUNT(*)
FROM disciplinas_alunos
WHERE nota <= 3 AND nota < 5
--Resposta: 11

--Qual foi a disciplina com maior número de reprovados (n < 3)
SELECT COUNT(disciplina_id) AS total, disciplina_id
FROM disciplinas_alunos
WHERE nota < 3
GROUP BY disciplina_id
ORDER BY 1 DESC;
--Resposta: ACH2024 - AED II

--Qual o professor com mais alunos
SELECT disciplinas.professor_id, professores.nome, COUNT(*)
FROM disciplinas_alunos, professores, disciplinas
WHERE disciplinas_alunos.disciplina_id = disciplinas.id AND disciplinas.professor_id = professores.id
GROUP BY professores.nome, disciplinas.professor_id
ORDER BY COUNT DESC;
--Resposta: Claudio Garcia 
