CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    data_cadastro DATE
);

CREATE TABLE categorias (
    categoria_id INT PRIMARY KEY,
    nome_categoria VARCHAR(100)
);

CREATE TABLE produtos (
    produto_id INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco DECIMAL(10,2),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE itens_pedido (
    item_id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- Dados dos Clientes
INSERT INTO clientes VALUES (1, 'Alice da Cunha', 'alicecunha@hotmail.cam', 'João Pessoa', 'PB', '11-10-2024');
INSERT INTO clientes VALUES (2, 'Carlos Eduardo Lima', 'carloslima@gmail.com', 'Olinda', 'PE', '05-07-2024');
INSERT INTO clientes VALUES (3, 'Helena Correia', 'helenacorreia@yahoo.com', 'Vitória', 'ES', '29-07-2024');

-- Dados das Categorias
INSERT INTO categorias VALUES (1, 'Alimentos');
INSERT INTO categorias VALUES (2, 'Eletrônicos');
INSERT INTO categorias VALUES (3, 'Roupas');

-- Dados dos Produtos
INSERT INTO produtos VALUES (1, 'Arroz', '25.57', 1);
INSERT INTO produtos VALUES (2, 'Leite', '7.55', 1);
INSERT INTO produtos VALUES (3, 'Queijo', '32.72', 1);
INSERT INTO produtos VALUES (4, 'Micro-ondas', '373.36', 2);
INSERT INTO produtos VALUES (5, 'Televisão', '1599.90', 2);
INSERT INTO produtos VALUES (6, 'iPhone 16', '4910.20', 2);
INSERT INTO produtos VALUES (7, 'Calça Jeans', '139.90', 3);
INSERT INTO produtos VALUES (8, 'Camiseta', '109.99', 3);
INSERT INTO produtos VALUES (9, 'Vestido', '139.99', 3);

-- Dados dos Pedidos
INSERT INTO pedidos VALUES (1, 1, '31-10-2024', '65.84');
INSERT INTO pedidos VALUES (2, 2, '02-07-2025', '6883.46');
INSERT INTO pedidos VALUES (3, 3, '23-06-2025', '389.88');

-- Dados dos Itens dos Pedidos
INSERT INTO itens_pedido VALUES (1, 1, 3, 1, '32.72');
INSERT INTO itens_pedido VALUES (2, 2, 6, 1, '4910.20');
INSERT INTO itens_pedido VALUES (3, 3, 7, 1, '139.00');


