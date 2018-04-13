DROP TABLE if exists Especializacao;
DROP TABLE if exists Localidade;
DROP TABLE if exists Pessoa;
DROP TABLE if exists Empresa;
DROP TABLE if exists Cliente;
DROP TABLE if exists Estabelecimento;
DROP TABLE if exists Fabrica;
DROP TABLE if exists Loja;
DROP TABLE if exists Venda;
DROP TABLE if exists Produto;
DROP TABLE if exists Pagamento;
DROP TABLE if exists Cheque;
DROP TABLE if exists Cartao;
DROP TABLE if exists Dinheiro;
DROP TABLE if exists Funcionario;
DROP TABLE if exists Material;
DROP TABLE if exists Fornecedor;
DROP TABLE if exists Material_Produto;
DROP TABLE if exists Material_Fornecedor;
DROP TABLE if exists Material_Fabrica;
DROP TABLE if exists Fornecedor_Fabrica;
DROP TABLE if exists Loja_Fabrica;
DROP TABLE if exists Produto_Estabelecimento;
DROP TABLE if exists Produto_Especializacao;


CREATE TABLE Especializacao (
    Nome text NOT NULL,
    PRIMARY KEY (Nome),
);

CREATE TABLE Localidade (
    CodPostal int NOT NULL,
    Localidade text NOT NULL,
    PRIMARY KEY (CodPostal)
);

CREATE TABLE Pessoa (
    CC int NOT NULL,
    Nome text NOT NULL, 
    Morada text NOT NULL, 
    CodPostal int,
    NIF int NOT NULL, 
    Telefone text, 
    Email text NOT NULL, 
    DataNasc text NOT NULL,  
    Banco text, 
    NumConta int, 
    PRIMARY KEY (CC),
    FOREIGN KEY (CodPostal) REFERENCES Localidade(CodPostal)
);

CREATE TABLE Empresa (
    Nome text NOT NULL,
    Morada text NOT NULL,
    CodPostal int,
    NIF int NOT NULL, 
    Telefone text, 
    Email text NOT NULL, 
    PRIMARY KEY (Nome),
    FOREIGN KEY (CodPostal) REFERENCES Localidade(CodPostal)
);

CREATE TABLE Cliente (
    CC int,
    NomeEmpresa text,
    PRIMARY KEY (CC),
    FOREIGN KEY (CC) REFERENCES Pessoa(CC),
    FOREIGN KEY (NomeEmpresa) REFERENCES Empresa(Nome)
);

CREATE TABLE Estabelecimento (
    IDEstabelecimento int NOT NULL,
    Morada text NOT NULL, 
    CodPostal int,
    Telefone text, 
    Email text NOT NULL, 
    NomeEmpresa text,
    PRIMARY KEY (IDEstabelecimento),
    FOREIGN KEY (NomeEmpresa) REFERENCES Empresa(Nome),
    FOREIGN KEY (CodPostal) REFERENCES Localidade(CodPostal)
);

CREATE TABLE Fabrica (
    IDEstabelecimento int,
    PRIMARY KEY (IDEstabelecimento),
    FOREIGN KEY (IDEstabelecimento) REFERENCES Estabelecimento(IDEstabelecimento)
);

CREATE TABLE Loja (
    IDEstabelecimento int,
    PRIMARY KEY (IDEstabelecimento),
    FOREIGN KEY (IDEstabelecimento) REFERENCES Estabelecimento(IDEstabelecimento)
);

CREATE TABLE Venda (
    IDVenda int NOT NULL,
    Quantia float NOT NULL,
    Data date NOT NULL,
    IDCliente int,
    IDEstabelecimento int, 
    PRIMARY KEY (IDVenda),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDEstabelecimento) REFERENCES Loja(IDEstabelecimento),
);

CREATE TABLE Produto (
    IDProduto int NOT NULL,
    Nome text NOT NULL, 
    Preco float, 
    Dimensao text,
    Cor text,
    IDVenda int,
    PRIMARY KEY (IDProduto),
    FOREIGN KEY (IDVenda) REFERENCES Venda(IDVenda)
);

CREATE TABLE Pagamento (
    IDPagamento int NOT NULL,
    IDVenda int NOT NULL,
    Quantia float NOT NULL,
    Tipo text NOT NULL,
    Efetuado text NOT NULL,
    Data date NOT NULL,
    PRIMARY KEY (IDTransacao),
    FOREIGN KEY (IDVenda) REFERENCES Venda(IDVenda)
);

CREATE TABLE Cheque (
    IDPagamento int NOT NULL,
    Banco text NOT NULL,
    Depositado text NOT NULL,
    DataDeposito date NOT NULL,
    PRIMARY KEY (IDPagamento),
    FOREIGN KEY (IDPagamento) REFERENCES Pagamento(IDPagamento)
);

CREATE TABLE Cartao (
    IDPagamento int NOT NULL,
    Banco text NOT NULL,
    NumConta int NOT NULL,
    PRIMARY KEY (IDPagamento),
    FOREIGN KEY (IDPagamento) REFERENCES Pagamento(IDPagamento)
);

CREATE TABLE Dinheiro (
    IDPagamento int NOT NULL,
    PRIMARY KEY (IDPagamento),
    FOREIGN KEY (IDPagamento) REFERENCES Pagamento(IDPagamento)
);

CREATE TABLE Funcionario (
    CC int,
    IDEstabelecimento int,
    Cargo text NOT NULL,
    Ordenado float NOT NULL, 
    AgregadoFamiliar int NOT NULL, 
    Horario text NOT NULL, 
    PRIMARY KEY (CC),                                            #DUVIDA!! 
    FOREIGN KEY (CC) REFERENCES Pessoa(CC),
    FOREIGN KEY (IDEstabelecimento) REFERENCES Estabelecimento(IDEstabelecimento)
);

CREATE TABLE Material (
    Nome text NOT NULL,
    Tipo text NOT NULL,
    Quantidade float NOT NULL,
    Preco float,
    Cor text,
    PRIMARY KEY (Nome)
);

CREATE TABLE Fornecedor (
    IDFornecedor int NOT NULL,
    NomeFornecedor text NOT NULL,
    Morada text NOT NULL,
    CodPostal int,
    NIF int NOT NULL, 
    Telefone text, 
    Email text NOT NULL, 
    PRIMARY KEY (IDFornecedor),
    FOREIGN KEY (CodPostal) REFERENCES Localidade(CodPostal)
);

CREATE TABLE Material_Produto (
    NomeMaterial text NOT NULL,
    IDProduto int NOT NULL,
    QntNecessaria text NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (NomeMaterial, IDProduto),
    FOREIGN KEY (NomeMaterial) REFERENCES Material(Nome),
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto)
);

CREATE TABLE Material_Fornecedor (
    NomeMaterial text NOT NULL,
    NomeFornecedor text NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (NomeMaterial, NomeFornecedor),
    FOREIGN KEY (NomeMaterial) REFERENCES Material(Nome),
    FOREIGN KEY (NomeFornecedor) REFERENCES Fornecedor(Nome)
);

CREATE TABLE Material_Fabrica (
    NomeMaterial text NOT NULL,
    IDEstabelecimento int NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (NomeMaterial, IDEstabelecimento),
    FOREIGN KEY (NomeMaterial) REFERENCES Material(Nome),
    FOREIGN KEY (IDEstabelecimento) REFERENCES Fabrica(IDEstabelecimento)
);

CREATE TABLE Fornecedor_Fabrica (
    NomeFornecedor text NOT NULL,
    IDEstabelecimento int NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (NomeFornecedor, IDEstabelecimento),
    FOREIGN KEY (NomeFornecedor) REFERENCES Fornecedor(Nome),
    FOREIGN KEY (IDEstabelecimento) REFERENCES Fabrica(IDEstabelecimento)
);

CREATE TABLE Loja_Fabrica (
    IDLoja int NOT NULL,
    IDFabrica int NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (IDLoja, IDFabrica),
    FOREIGN KEY (IDLoja) REFERENCES Loja(IDEstabelecimento),
    FOREIGN KEY (IDFabrica) REFERENCES Fabrica(IDEstabelecimento)
);

CREATE TABLE Produto_Estabelecimento (
    IDProduto int NOT NULL,
    IDEstabelecimento int NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (IDProduto, IDEstabelecimento),
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
    FOREIGN KEY (IDEstabelecimento) REFERENCES Estabelecimento(IDEstabelecimento)
);

CREATE TABLE Produto_Especializacao (
    IDProduto int NOT NULL,
    NomeEspecializacao int NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (IDProduto, NomeEspecializacao),
    FOREIGN KEY (IDProduto) REFERENCES Produto(IDProduto),
    FOREIGN KEY (NomeEspecializacao) REFERENCES Especializacao(Nome)
);


