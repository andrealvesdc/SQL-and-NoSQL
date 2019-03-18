create database SCP

/* Assunto novo: stored procedure*/

/*Cria a procedured*/
create procedure ClienteTipo
@tipo varchar(5)
as 
select nome
from cliente
where tipo = @tipo

/*Execuatar a procedure*/
Exec ClienteTipo 'PJ'


/*Alterar a procedure*/
alter procedure ClienteTipo
@tipo varchar(5)
as 
select nome
from cliente
where tipo = @tipo


/*Apagar a procedure*/
drop procedure ClienteTipo
@tipo varchar(5)
as 
select nome
from cliente
where tipo = @tipo



create procedure ClientePed2017
@nome varchar(30)
as
Select pe.*
from pedido pe join cliente c on c.codigo = pe.cliente
where DATEPART (yy, pe.dataPedido)=2017
and c.nome like '%' +@nome+ '%'


Exec ClientePed2017 'Maria'


/*Paremetos de entrada de procedured*/
create procedure QuantPed2017
@nome varchar(30), @quant int output
as
Select @quant = count(*)
from pedido pe join cliente c on c.codigo = pe.cliente
where DATEPART (yy, pe.dataPedido)=2017
and c.nome like '%' +@nome+ '%'


Declare @quant int

Exec QuantPed 'Larissa Maia',
@quant output

Select @quant