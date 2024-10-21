
create database PIM; -- criando
use PIM; -- usando

create table funcionario( -- criando a tabela de funcionario
id integer not null primary key auto_increment,
id_salarial integer not null,
nome varchar (45) not null,
departamento varchar(45) not null,
cargo varchar (45),
data_de_nascimento date,
data_de_admissao date not null,
status_ varchar(45) not null,
constraint foreign key(id_salarial) references historicoSalarial(id)
);

create table historicoSalarial( -- criando tabela de historico salarial
id integer not null primary key auto_increment,
id_funcionario integer not null,
salario double not null,
data_inicio date
);

create table folha( -- criando tabela de folha
id integer not null primary key auto_increment,
id_funcionario integer not null,
mes varchar(15),
ano int,
totalSalarial double,
constraint foreign key(id_funcionario) references funcionario(id)
);

-- comandos para apagar as tabelas
drop table historicoSalarial;
drop table funcionario;
drop table folha;

-- adicionando uma foreing key na tabela funcionario
alter table funcionario
	add constraint foreign key(id_salarial) references historicoSalarial(id);
    
-- -----------------------------------------------------------------------------------------------
    
	-- Planilha de testes
    
	-- Populando a tabela "funcionario"
INSERT INTO `funcionario` (`id_salarial`, `nome`, `departamento`, `cargo`, `data_de_nascimento`, `data_de_admissao`, `status_`)
VALUES
(1, 'João Silva', 'Vendas', 'Vendedor', '1985-05-10', '2021-01-15', 'Ativo'),
(2, 'Maria Santos', 'Financeiro', 'Analista', '1990-09-22', '2020-03-01', 'Ativo'),
(3, 'Pedro Lima', 'RH', 'Gerente', '1980-12-01', '2018-06-10', 'Inativo');

	
-- Populando a tabela "historicoSalarial"
INSERT INTO historicoSalarial (id_funcionario, salario, data_inicio)
VALUES 
(2, 4000.00, '2020-03-01'),
(3, 5000.00, '2018-06-10');


	-- Populando a tabela "folha"
INSERT INTO folha (id_funcionario, mes, ano, totalSalarial)
VALUES
(1, 'Janeiro', 2023, 3000.00),
(2, 'Janeiro', 2023, 4000.00),
(3, 'Janeiro', 2023, 5000.00);

-- Populando a tabela "historicoSalarial"
INSERT INTO historicoSalarial (id_funcionario, salario, data_inicio)
VALUES (1, 3000.00, '2021-01-02');

	-- Teste de inserção de dados:

-- Inserção de um novo funcionário
INSERT INTO funcionario (id_salarial, nome, departamento, cargo, data_de_nascimento, data_de_admissao, status_)
VALUES (4, 'Ana Rodrigues', 'Marketing', 'Analista de Marketing', '1992-08-17', '2022-02-01', 'Ativo');

-- Inserção de um novo histórico salarial
INSERT INTO historicoSalarial (id_funcionario, salario, data_inicio)
VALUES (4, 3500.00, '2022-02-01');

-- Inserção de uma nova folha de pagamento
INSERT INTO folha (id_funcionario, mes, ano, totalSalarial)
VALUES (4, 'Janeiro', 2023, 3500.00);

	-- Teste de atualização de dados:

-- Atualização do cargo de um funcionário
UPDATE funcionario SET cargo = 'Supervisor de Vendas' WHERE id = 1;

-- Atualização do salário em um histórico salarial
UPDATE historicoSalarial SET salario = 3200.00 WHERE id = 1;

-- Atualização do total salarial em uma folha de pagamento
UPDATE folha SET totalSalarial = 3200.00 WHERE id = 1;

	-- Teste de exclusão de dados:

-- Exclusão de um funcionário específico
DELETE FROM funcionario WHERE id = 3;

-- Exclusão de um histórico salarial específico
DELETE FROM historicoSalarial WHERE id = 2;

-- Exclusão de uma folha de pagamento específica
DELETE FROM folha WHERE id = 2;

	-- Teste de consulta de dados:

-- Consulta para obter informações sobre todos os funcionários de um departamento específico
SELECT * FROM funcionario WHERE departamento = 'Vendas';

-- Consulta para calcular o total salarial de um mês e ano específicos
SELECT SUM(totalSalarial) AS TotalSalarial FROM folha WHERE mes = 'Janeiro' AND ano = 2023;

	-- Teste de chaves estrangeiras:

-- Inserção de um registro na tabela "funcionario" com uma chave estrangeira inválida
INSERT INTO funcionario (id_salarial, nome, departamento, cargo, data_de_nascimento, data_de_admissao, status_)
VALUES (10, 'José Oliveira', 'Vendas', 'Vendedor', '1988-03-25', '2021-05-10', 'Ativo');

-- Esse comando deve falhar, pois o valor 10 não existe na tabela "historicoSalarial".

-- -----------------------------------------------------------------------------------------------

-- Selecionando tudo para ver se deu certo
select * from folha;
select * from funcionario;
select * from historicoSalarial;

-- comando para deletar os dados
delete from historicoSalarial;
delete from funcionario;
delete from folha;

-- resolvendo erros
show create table funcionario;
alter table funcionario drop foreign key funcionario_ibfk_1;

show create table historicosalarial;
alter table historicosalarial drop foreign key historicosalarial_ibfk_1;

show create table folha;
alter table folha drop foreign key folha_ibfk_1;

alter table folha auto_increment=1;
alter table funcionario auto_increment=1;
alter table historicosalarial auto_increment=1;
