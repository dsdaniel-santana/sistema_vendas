-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS sistema_vendas;
USE sistema_vendas; 

-- TABELA CATEGORIA
CREATE TABLE IF NOT EXISTS categoria (
	Id INT AUTO_INCREMENT PRIMARY KEY, 
    Nome VARCHAR (100) NOT NULL,
    Descricao TEXT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    Ativo TINYINT(1) DEFAULT 1       
);

-- TABELA FORMA PAGAMENTO
CREATE TABLE IF NOT EXISTS FormaPagamento(
	Id INT AUTO_INCREMENT PRIMARY KEY, 
    Nome VARCHAR (100) NOT NULL,
    Descricao TEXT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    Ativo TINYINT(1) DEFAULT 1 
);

-- TABELA PRODUTO
CREATE TABLE IF NOT EXISTS Produto (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10,2) NOT NULL,
    CategoriaID INT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    Ativo TINYINT(1) DEFAULT 1,
    INDEX idx_nome (Nome), -- Adiciona índice nas colunas Nome
    CONSTRAINT fk_categoria_produto FOREIGN KEY (CategoriaID) REFERENCES Categoria(Id)
);

-- TABELA CLIENTE 
CREATE TABLE IF NOT EXISTS Cliente (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    Ativo TINYINT(1) DEFAULT 1,
    INDEX idx_nome (Nome)
);

-- TABELA PEDIDO
CREATE TABLE IF NOT EXISTS Pedido (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATETIME,
    FormaPagamentoId INT,
    Status VARCHAR(50),
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(Id),
    FOREIGN KEY (FormaPagamentoId) REFERENCES FormaPagamento(Id)    	
);

-- TABELA ITEMPEDIDO
CREATE TABLE IF NOT EXISTS ItemPedido(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    PedidoId INT,
    ProdutoId INT,
    Quantidade INT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    FOREIGN KEY (PedidoId) REFERENCES Pedido(Id),
    FOREIGN KEY (ProdutoId) REFERENCES Produto(Id)
);

-- Tabela GrupoUsuario
CREATE TABLE IF NOT EXISTS GrupoUsuario (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    Ativo TINYINT(1) DEFAULT 1
);

-- Tabela Permissao
CREATE TABLE IF NOT EXISTS Permissao (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    Ativo TINYINT(1) DEFAULT 1
);

-- Tabela PermissaoGrupo
CREATE TABLE IF NOT EXISTS PermissaoGrupo (
    PermissaoID INT,
    GrupoUsuarioID INT,
    PRIMARY KEY (PermissaoID, GrupoUsuarioID),
    FOREIGN KEY (PermissaoID) REFERENCES Permissao(Id),
    FOREIGN KEY (GrupoUsuarioID) REFERENCES GrupoUsuario(Id)
);

-- Tabela Usuario
CREATE TABLE IF NOT EXISTS Usuario (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    NomeUsuario VARCHAR(50) NOT NULL,
    Senha VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    GrupoUsuarioID INT,
    Ativo TINYINT(1) DEFAULT 1,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DataAtualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UsuarioAtualizacao INT,
    UNIQUE (NomeUsuario), -- Restrição UNIQUE na coluna NomeUsuario
    UNIQUE (Email), -- Restrição UNIQUE na coluna Email
    FOREIGN KEY (GrupoUsuarioID) REFERENCES GrupoUsuario(Id)
);
