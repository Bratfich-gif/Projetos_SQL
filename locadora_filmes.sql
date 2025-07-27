-- Tabela de clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(15)
);

-- Tabela de filmes
CREATE TABLE filmes (
    id_filme INT PRIMARY KEY,
    titulo VARCHAR(100),
    genero VARCHAR(50),
    ano_lancamento INT
);

-- Tabela de aluguéis
CREATE TABLE alugueis (
    id_aluguel INT PRIMARY KEY,
    id_cliente INT,
    id_filme INT,
    data_aluguel DATE,
    data_devolucao DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme)
);

-- Clientes
INSERT INTO clientes VALUES (1, 'Ana', 'ana@email.com', '11999999999');
INSERT INTO clientes VALUES (2, 'Carlos', 'carlos@email.com', '11888888888');

-- Filmes
INSERT INTO filmes VALUES (1, 'Matrix', 'Ficção Científica', 1999);
INSERT INTO filmes VALUES (2, 'O Poderoso Chefão', 'Drama', 1972);
INSERT INTO filmes VALUES (3, 'Toy Story', 'Animação', 1995);

-- Aluguéis
INSERT INTO alugueis VALUES (1, 1, 1, '2025-07-19', NULL);
INSERT INTO alugueis VALUES (2, 2, 3, '2025-07-18', '2025-07-20');

-- Listar todos os filmes disponíveis
SELECT * FROM filmes;

-- Ver quem alugou qual filme
SELECT clientes.nome, filmes.titulo, alugueis.data_aluguel
FROM alugueis
JOIN clientes ON alugueis.id_cliente = clientes.id_cliente
JOIN filmes ON alugueis.id_filme = filmes.id_filme;

-- Atualizar número de telefone de um cliente
UPDATE clientes SET telefone = '11777777777' WHERE nome = 'Ana';

-- Deletar um aluguel
DELETE FROM alugueis WHERE id_aluguel = 2;

SELECT * FROM alugueis;
SELECT * FROM clientes;