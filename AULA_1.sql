use guiatur;

create table if not exists pais(	
	id int(11) not null auto_increment primary key,
	nome varchar(50) not null default '',
	continente enum ('Ásia', 'Europa', 'America', 'África', 'Oceania', 'Antárdia') not null default 'Ámerica',
	codigo char(3) not null default ''	
);

create table if not exists estado(
	id int(11) not null auto_increment primary key,
	nome varchar(50) not null default '',
	sigla char(2) not null default ''
);

create table if not exists cidade(
	id int(11) not null auto_increment primary key,
	nome varchar(50) not null default '',
	populacao int(11) not null default '0'
);

SELECT * FROM cidade;

DELETE FROM cidade 
WHERE id in (1,2,3,4);

create table if not exists ponto_tur(
	id int(11) not null auto_increment primary key,
	nome varchar(50) not null default '',
	populacao int(11) not null default '0',
	tipo enum('Atrativo', 'Serviço', 'Equipamento', 'Infraestrutura', 'Instituição', 'Organização'),
	puplicado enum('Não', 'Sim') not null default 'NÃO'
);

create table if not exists coordenadas(
	latitude float(10,6),
	longitude float(10,6)
);
CREATE TABLE IF NOT EXISTS linguagemPais(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	codigoPais INT(11),
	linguagem VARCHAR(30) NOT NULL DEFAULT '',
	oficial ENUM('Sim', 'Não') DEFAULT 'Não'
);


INSERT INTO pais(nome,continente,codigo) 
values
('Braisl','America','BR'),
('Índia','Ásia','IND'),
('China','Ásia','CH'),
('Japão','Ásia','JAP');

INSERT INTO estado(nome,sigla) 
values('Maranhão','MA'),
('São Paulo','SP'),
('Santa Catarina','SC'),
('Rio de Janeiro','RJ');

INSERT INTO cidade(nome,populacao) 
values
('Sorocaba','120000'),
('Déli','10000000'),
('Xangaim Tóquio','233000000');

 INSERT INTO ponto_tur(nome,tipo)
values
('Quinzinho de Barros','Instituição'), 
 ('Parque do Jalapão','Atrativo'),
 ('Torre Eiffel','Atrativo'),
 ('Fogo de Chão','Serviço');

SELECT * FROM ponto_tur;

update ponto_tur set tipo = 'Atrativo' where id = 1;

# Alterção em 3 níveis
# Mudança na definição do banco de (DDL)
# Identificar quais campos estão vazios (DQL)
# Idenficar quais relacionamentos estão quebrados (DML)

# Cria integridade referencial entre as Tabelas linguagemPais e país

ALTER TABLE linguagemPais ADD CONSTRAINT FK_linguagempais FOREIGN KEY (codigopais) REFERENCES pais(id);

DESCRIBE linguagemPais;

# Modificar o código do país para ser obrigatório a inclusão
 
ALTER TABLE linguagemPais MODIFY codigopais INT(11) NOT NULL;

DESCRIBE linguagemPais;

# Teste de exlusão - inserindo dados na tabela com chave estrangeira

INSERT INTO linguagemPais VALUES (0,4,'japones','sim');
SELECT * FROM linguagemPais;
DROP TABLE pais ;
 
# Excluir a restrição de chave estrangeira e tabela

ALTER TABLE linguagemPais DROP FOREIGN KEY FK_linguagemPais;

# Agora a tabela país pode ser exlcuída

DROP TABLE pais;

SELECT *
FROM information_schema.key_column_usage
WHERE CONSTRAINT_SCHEMA = 'guiatur';

# Alterar a tabela de Elementos Turístico, adiconando campos latitude e longitute.
DESCRIBE ponto_tur;

ALTER TABLE ponto_tur
ADD coordemada POINT;

DROP TABLE coordenadas;

SHOW TABLES;

# Alterar a tabela "Paíese", Adicionando uma nota de 0 a 10 com nível de interesse para o turista ('0','1','2','3','4','5','6','7','8','9'',10')

ALTER TABLE pais 
ADD interesse ENUM('0','1','2','3','4','5','6','7','8','9','10');

DESCRIBE pais;

#Alterar tabela "Cidades", incluindo uma lista com os três melhores restaurantes.

ALTER TABLE cidade ADD melheresRest VARCHAR(300) DEFAULT '';
 DESCRIBE cidade;


SELECT * FROM ponto_tur;

ALTER TABLE ponto_tur RENAME COLUMN coordemada TO coordenada;

INSERT INTO ponto_tur(nome,coordenada)
VALUES('ponto da Amizade', POINT(1.123456,3.434343));









