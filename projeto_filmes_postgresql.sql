-- Script de criação
CREATE TABLE Atores (
    Id SERIAL PRIMARY KEY,
    PrimeiroNome VARCHAR(20),
    UltimoNome VARCHAR(20),
    Genero CHAR(1)
);

CREATE TABLE Filmes (
    Id SERIAL PRIMARY KEY,
    Nome VARCHAR(50),
    Ano INT,
    Duracao INT
);

CREATE TABLE Generos (
    Id SERIAL PRIMARY KEY,
    Genero VARCHAR(20)
);

CREATE TABLE FilmesGenero (
    Id SERIAL PRIMARY KEY,
    IdGenero INT REFERENCES Generos(Id),
    IdFilme INT REFERENCES Filmes(Id)
);

CREATE TABLE ElencoFilme (
    Id SERIAL PRIMARY KEY,
    IdAtor INT REFERENCES Atores(Id),
    IdFilme INT REFERENCES Filmes(Id),
    Papel VARCHAR(30)
);

INSERT INTO Atores (PrimeiroNome, UltimoNome, Genero) VALUES
('James', 'Stewart', 'M'),
('Deborah', 'Kerr', 'F'),
('Peter', 'OToole', 'M');

INSERT INTO Filmes (Nome, Ano, Duracao) VALUES
('Um Corpo que Cai', 1958, 128),
('Os Inocentes', 1961, 100),
('Lawrence da Arábia', 1962, 216);

INSERT INTO Generos (Genero) VALUES
('Drama'),
('Aventura');

INSERT INTO FilmesGenero (IdGenero, IdFilme) VALUES
(1, 1),
(2, 3);

INSERT INTO ElencoFilme (IdAtor, IdFilme, Papel) VALUES
(1, 1, 'John Scottie Ferguson'),
(2, 2, 'Miss Giddens'),
(3, 3, 'T.E. Lawrence');


-- Consultas executadas
-- Todos os filmes com seus anos
SELECT Nome, Ano FROM Filmes;

-- Atores do gênero masculino
SELECT PrimeiroNome, UltimoNome FROM Atores WHERE Genero = 'M';

-- Lista de filmes com seus respectivos gêneros
SELECT f.Nome, g.Genero
FROM Filmes f
JOIN FilmesGenero fg ON f.Id = fg.IdFilme
JOIN Generos g ON g.Id = fg.IdGenero;
