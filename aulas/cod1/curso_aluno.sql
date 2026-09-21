-- Active: 1787608554560@@127.0.0.1@5432@bd_aula@public
CREATE TABLE curso(
    id_curso INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE aluno(
    id_aluno INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    id_curso INTEGER NOT NULL REFERENCES curso(id_curso)
);

SELECT * FROM curso; 

SELECT * FROM aluno;

INSERT INTO curso (nome) VALUES 
('Sistemas de Informacao'),
('Administracao'),
('Contabilidade'),
('Direito'),
('Biomedicina');

INSERT INTO aluno (nome, id_curso) VALUES
('Eshilley Flavia Alves de Melo', 1),
('Maria Clara da Silva Santos', 4),
('Isabely Lopes', 3),
('Yasmim Rocha', 2),
('Alicia Dara Gurgel',5);

SELECT id_aluno, nome, id_curso FROM aluno

ORDER BY id_aluno ASC;

SELECT table_name,
       column_name,
       data_type,
       character_maximum_length AS tamanho,
       is_nullable              AS aceita_nulo,
       is_identity              AS e_identidade
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN ('curso', 'aluno')
ORDER BY table_name, ordinal_position;

SELECT indexname, indexdef FROM pg_indexes WHERE tablename = 'curso';

SELECT nome, id_curso FROM aluno WHERE id_curso = 4 ORDER BY nome;

SELECT a.nome AS Aluno, c.nome AS Curso FROM aluno a JOIN curso c ON c.id_curso = a.id_curso ORDER BY c.nome;

SELECT c.nome AS curso, c.id_curso FROM  curso c WHERE nome = 'Sistemas de Informacao';

--QUANTOS ALUNOS EM CADA CURSO
SELECT c.nome AS curso, COUNT(a.id_aluno) FROM curso c JOIN aluno a ON a.id_curso = c.id_aluno GROUP BY c.nome;