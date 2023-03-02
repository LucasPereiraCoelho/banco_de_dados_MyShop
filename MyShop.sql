#create database myShop;
#use myShop;


create table pessoas (

	idPessoas bigint primary key not null auto_increment,
    nomePessoa varchar(50) not null,
    numPessoa varchar(50) not null,
    dataNascPessoa date not null
	
);

create table usuarios(

	idUsuario bigint primary key not null auto_increment,
	emailUsuario varchar(100) not null,
    senhaUsuario varchar(50) not null,
    compUsuario varchar(50),
    idPessoas bigint(20) not null
    
);

create table funcionarios(

	idFunc bigint primary key not null auto_increment,
    matFunc int not null,
    desdeFunc date,
	idPessoas bigint(20) not null
    
);

create table adm(

	idAdm bigint primary key not null auto_increment,
    cnpjAdm varchar(50) not null,
	idPessoas bigint(20) not null,
    idFunc bigint(20) not null,
    idLoja bigint(20) not null
    
);

create table lojas(

	idLoja bigint primary key not null auto_increment,
    nomeLoja varchar(100) not null,
    localLoja varchar(100) not null,
    tellLoja varchar(100) not null,
    cnpjLoja varchar(50) not null,
    tipoLoja varchar(20),
    emailLoja varchar(100) not null,
    avalLoja decimal(1,1),
    idPedidos bigint(20) not null,
    idFunc bigint(20) not null
    
);

create table pedidos(

	idPedidos bigint primary key not null auto_increment,
    itensPedido varchar(150) not null,
    
    dataPedido datetime not null,
    valorPedido decimal(12,2) not null,
	idFunc bigint(20) not null,
    idPagamento bigint(20) not null,
    idUsuario bigint(20) not null
    
);

create table pagamento (

	idPagamento bigint primary key not null auto_increment,
    datapagamento datetime not null,
    valorPagamento decimal(12,2) not null,
    resoPagamento varchar(50),
    formaPagamento varchar(50) not null
    
);



#ALTERAÇÃO
#USUARIO
alter table usuarios add constraint fk_usuarios_pessoas foreign key(idPessoas) references pessoas(idPessoas);

#FUNCIONARIOS
alter table funcionarios add constraint fk_funcionarios_pessoas foreign key(idPessoas) references pessoas(idPessoas);

#ADM
alter table adm add constraint fk_adm_pessoas foreign key(idPessoas) references pessoas(idPessoas);

alter table adm add constraint fk_adm_lojas foreign key(idLoja) references lojas(idLoja);

alter table adm add constraint fk_adm_funcionarios foreign key(idFunc) references funcionarios(idFunc);

#LOJAS
alter table lojas add constraint fk_loja_pedidos foreign key(idPedidos) references pedidos(idPedidos);

alter table lojas add constraint fk_loja_funcionarios foreign key(idFunc) references funcionarios(idFunc);

#PEDIDOS
alter table pedidos add constraint fk_pedidos_funcionarios foreign key(idFunc) references funcionarios(idFunc);

alter table pedidos add constraint fk_pedidos_pagamento foreign key(idPagamento) references pagamento(idPagamento);

alter table pedidos add constraint fk_pedidos_usuarios foreign key(idUsuario) references usuarios(idUsuario);




#EXCLUSAO
delete from lojas where idLoja = 1;

alter table lojas drop column avalLoja;
 


#VALUES
insert pessoas ( nomePessoa, numPessoa, dataNascPessoa )
values ("Leonardo", "48 99888-7766", '2022-09-15'),
("Lucas", "51 98899-5544", '2022-09-14' ),
("Jean", "48 98810-5334", '2022-09-10' ),
("Matheus", "47 98899-2233", '2022-09-14' ),
("Marcelo", "49 99999-5555", '2022-09-09' );

insert usuarios (emailUsuario, senhaUsuario, compUsuario, idPessoas)
values ("leo123@gmail.com", "leo1234", "alexa",1),
("lucas@gmail.com", "luquinhas22", "scarpin",2),
("jean@hotmail.com", "aleluiaAmem", "creatina",3),
("kantsalva@gmail.com", "kantsalva01", "redbull",4),
("marcelo@outlook.com", "marcelindoscria", "abacate",5);

insert funcionarios (matFunc, desdeFunc, idPessoas)
values ("234452", "2009-12-10", 1),
("256740", "2020-11-30", 2),
("429920", "2022-01-22", 3),
("987721", "2015-07-26", 4),
("234452", "2018-08-15", 5);


insert adm (cnpjAdm, idPessoas, idFunc, idLoja)
values ("05.725.350/0001-20", 1,1,12),
("07.666.999/0001-30", 2,2,13),
("40.321.123/0001-09", 3,3,14),
("10.789.987/0001-88", 4,4,15),
("0.456.654/0001-20", 5,5,16);

insert lojas (nomeLoja, localLoja, tellLoja, cnpjLoja, tipoLoja, emailLoja, idPedidos, idFunc)
values ("Amazon", "Estados Unidos", "+1 450 333-444", "99.554.552/0001-78", "eletronicos", "amazon@hotmail.com",11,1),
("Studio Z", "Brasil", "48 3232-1991", "11.222.333/0001-40", "calçados", "studioz@gmail.com",12,2),
("Growth", "Brasil", "48 3349-2876", "05.347.667/0001-09", "suplementos", "growth@hotmail.com",13,3),
("Imperatriz", "Brasil", "48 3350-4422", "02.999.777/0001-10", "mercado", "impera@triz.com",14,4),
("Imperatriz", "Brasil", "48 3350-4422", "02.999.777/0001-10", "mercado", "impera@triz.com",15,5);

insert pedidos (itensPedido, dataPedido, valorPedido, idFunc, idPagamento, idUsuario)
values ("alexa", "2022-08-22 21:05:49", 150.00, 1,1,1),
("scarpin", "2022-07-13 19:26:15", 99.00, 2,2,2),
("creatina", "2022-12-05 19:28:40", 54.90, 3,3,3),
("red bull", "2022-08-22 17:30:00", 09.00, 4,4,4),
("abacate", "2022-05-22 21:05:49", 02.50, 5,5,5);

insert pagamento (datapagamento, valorPagamento, formaPagamento)
values ("2022-08-22 21:05:49", 150.00, "credito"),
("2022-07-13 19:26:15", 99.00, "cheque especial"),
("2022-12-05 19:28:40", 54.90, "pix"),
("2022-08-22 17:30:00", 09.00, "dinheiro"),
("2022-05-22 21:05:49", 02.50, "debito");



