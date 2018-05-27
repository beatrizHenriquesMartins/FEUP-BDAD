DROP TABLE if exists Especializacao;
DROP TABLE if exists Localidade;
DROP TABLE if exists Material;
DROP TABLE if exists Pessoa;
DROP TABLE if exists Empresa;
DROP TABLE if exists Cliente;
DROP TABLE if exists Estabelecimento;
DROP TABLE if exists Funcionario;
DROP TABLE if exists Fabrica;
DROP TABLE if exists Loja;
DROP TABLE if exists Venda;
DROP TABLE if exists Produto;
DROP TABLE if exists Pagamento;
DROP TABLE if exists Cheque;
DROP TABLE if exists Cartao;
DROP TABLE if exists Dinheiro;
DROP TABLE if exists Fornecedor;
DROP TABLE if exists Material_Produto;
DROP TABLE if exists Material_Fornecedor;
DROP TABLE if exists Material_Fabrica;
DROP TABLE if exists Fornecedor_Fabrica;
DROP TABLE if exists Loja_Fabrica;
DROP TABLE if exists Estabelecimento_Produto;
DROP TABLE if exists Produto_Especializacao;

CREATE TABLE Especializacao (
    id INTEGER PRIMARY KEY,
    nome TEXT
);

CREATE TABLE Localidade (
    codPostal INTEGER PRIMARY KEY,
    localidade TEXT NOT NULL
);

CREATE TABLE Material (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    tipo TEXT NOT NULL,
    quantidade FLOAT NOT NULL,
    preco FLOAT,
    cor TEXT
);

CREATE TABLE Pessoa (
    nif INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    morada TEXT,  
    telefone TEXT, 
    email TEXT, 
    dataNasc TEXT,  
    banco TEXT, 
    numConta INT,
    codPostal INT, 
    FOREIGN KEY (codPostal) REFERENCES Localidade(codPostal)
);

CREATE TABLE Empresa (
    nif INTEGER PRIMARY KEY, 
    nome TEXT NOT NULL,
    morada TEXT NOT NULL,
    telefone TEXT NOT NULL, 
    email TEXT NOT NULL, 
    empresa_codPostal INT,
    FOREIGN KEY (empresa_codPostal) REFERENCES Localidade(codPostal)
);

CREATE TABLE Cliente (
    cliente_nif INTEGER PRIMARY KEY,
    empresa_nif INT,
    FOREIGN KEY (cliente_nif) REFERENCES Pessoa(nif),
    FOREIGN KEY (empresa_nif) REFERENCES Empresa(nif)
);

CREATE TABLE Estabelecimento (
    id INTEGER PRIMARY KEY,
    morada TEXT NOT NULL, 
    telefone TEXT NOT NULL, 
    tipo TEXT NOT NULL,
    email TEXT, 
    empresa_nif INT,
    estabelecimento_codPostal INT,
    FOREIGN KEY (empresa_nif) REFERENCES Empresa(nif),
    FOREIGN KEY (estabelecimento_codPostal) REFERENCES Localidade(codPostal)
);

CREATE TABLE Funcionario (
    funcionario_nif INTEGER PRIMARY KEY,
    cargo TEXT NOT NULL,
    ordenado FLOAT NOT NULL, 
    agregadoFamiliar INT NOT NULL, 
    horario TEXT NOT NULL,
    especializacao_id INT NOT NULL, 
    estabelecimento_id INT,
    FOREIGN KEY (funcionario_nif) REFERENCES Pessoa(nif),
    FOREIGN KEY (estabelecimento_id) REFERENCES Estabelecimento(id),
    FOREIGN KEY (especializacao_id) REFERENCES Especializacao(id)
);

CREATE TABLE Fabrica (
    fabrica_id INTEGER PRIMARY KEY,
    FOREIGN KEY (fabrica_id) REFERENCES Estabelecimento(id)
);

CREATE TABLE Loja (
    estabelecimento_id INTEGER PRIMARY KEY,
    FOREIGN KEY (estabelecimento_id) REFERENCES Estabelecimento(id)
);

CREATE TABLE Venda (
    id INTEGER PRIMARY KEY,
    quantia FLOAT NOT NULL,
    dataVenda date NOT NULL,
    cliente_id INT,
    estabelecimento_id INT, 
    FOREIGN KEY (cliente_id) REFERENCES Cliente(nif),
    FOREIGN KEY (estabelecimento_id) REFERENCES Loja(id)
);

CREATE TABLE Produto (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL, 
    preco FLOAT NOT NULL, 
    dimensao TEXT,
    cor TEXT,
    quantidadeVendida INT,
    venda_id INT,
    FOREIGN KEY (venda_id) REFERENCES Venda(id)
);

CREATE TABLE Pagamento (
    id INTEGER PRIMARY KEY,
    quantia FLOAT NOT NULL,
    tipo TEXT NOT NULL,
    efetuado TEXT NOT NULL,
    dataPagamento TEXT NOT NULL,
    venda_id INT,
    FOREIGN KEY (venda_id) REFERENCES Venda(id)
);

CREATE TABLE Cheque (
    pagamento_id INTEGER PRIMARY KEY,
    banco TEXT NOT NULL,
    depositado TEXT NOT NULL,
    dataDeposito TEXT NOT NULL,
    FOREIGN KEY (pagamento_id) REFERENCES Pagamento(id)
);

CREATE TABLE Cartao (
    pagamento_id INTEGER PRIMARY KEY,
    banco TEXT NOT NULL,
    numConta INT NOT NULL,
    taxa FLOAT NOT NULL,
    FOREIGN KEY (pagamento_id) REFERENCES Pagamento(id)
);

CREATE TABLE Dinheiro (
    pagamento_id INTEGER PRIMARY KEY,
    FOREIGN KEY (pagamento_id) REFERENCES Pagamento(id)
);

CREATE TABLE Fornecedor (
    nif INTEGER PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE,
    morada TEXT NOT NULL,
    telefone TEXT NOT NULL, 
    email TEXT NOT NULL, 
    fornecedor_codPostal INT, 
    FOREIGN KEY (fornecedor_codPostal) REFERENCES Localidade(codPostal)
);

CREATE TABLE Material_Produto (
    material_id INT,
    produto_id INT,
    quantidadeNecessaria INT NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (material_id, produto_id),
    FOREIGN KEY (material_id) REFERENCES Material(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

CREATE TABLE Material_Fornecedor (
    material_id INT,
    fornecedor_id INT,
    CONSTRAINT chaveComposta PRIMARY KEY (material_id, fornecedor_id),
    FOREIGN KEY (material_id) REFERENCES Material(idMaterial),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(nif)
);

CREATE TABLE Material_Fabrica (
    material_id INT,
    estabelecimento_id INT,
    CONSTRAINT chaveComposta PRIMARY KEY (material_id, estabelecimento_id),
    FOREIGN KEY (material_id) REFERENCES Material(id),
    FOREIGN KEY (estabelecimento_id) REFERENCES Fabrica(fabrica_id)
);

CREATE TABLE Fornecedor_Fabrica (
    fornecedor_id INT,
    estabelecimento_id INT,
    CONSTRAINT chaveComposta PRIMARY KEY (fornecedor_id, estabelecimento_id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(nif),
    FOREIGN KEY (estabelecimento_id) REFERENCES Fabrica(fabrica_id)
);

CREATE TABLE Loja_Fabrica (
    loja_id INT,
    fabrica_id INT,
    CONSTRAINT chaveComposta PRIMARY KEY (loja_id, fabrica_id),
    FOREIGN KEY (loja_id) REFERENCES Loja(id),
    FOREIGN KEY (fabrica_id) REFERENCES Fabrica(id)
);

CREATE TABLE Estabelecimento_Produto (
    estabelecimento_id INT,
    produto_id INT,
    CONSTRAINT chaveComposta PRIMARY KEY (produto_id, estabelecimento_id),
    FOREIGN KEY (estabelecimento_id) REFERENCES Estabelecimento(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

CREATE TABLE Produto_Especializacao (
    produto_id INT,
    especializacao_id INT,
    CONSTRAINT chaveComposta PRIMARY KEY (produto_id, especializacao_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id),
    FOREIGN KEY (especializacao_id) REFERENCES Especializacao(id)
);

CREATE TABLE Venda_Produto(
    venda_id INT,
    produto_id INT,
    CONSTRAINT chaveComposta PRIMARY KEY (venda_id, produto_id),
    FOREIGN KEY (venda_id) REFERENCES Venda(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);


