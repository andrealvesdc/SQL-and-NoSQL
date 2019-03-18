/*create database CSP*/

/*SubConsultas*/

/*Quis os nomes dos funcionarios que realizaram produto masi barato em 2018?*/

select f.nome
from funcionario f join pedido pe
	on f.codido= pe.vendedor join 
	itens  i on pe.codido = i.pedido
	join produto pr on pr.codido=i.produto
where datepart(yy,pe.datapedido)=2018 and pr.venda=(select min(venda)
from produto)


select nome
from funcionario
where codigo in
	(select vendedor from pedido
	where datepart(yy,datapedido)=2018
	and codido in (
		select pedido from itens
		where produto in (
			select codigo from produto
			where venda = (select min(venda)
				from produto))))

/*Quais os nomes 
e tipos dos clientes de jão pessoa, que realizaram pedidos de tv lcd entre os anos de 2014 e 2018?(SUB CONSULTA OBRIGATÓRIA)*/

select nome, tipo
from cliente
where cidade in 
	(select codigo from cidade 
	where nome = 'João Pessoa') and
codigo in
	(select cliente from pedido
	 where datepart(yy, datapedido)between 2014 and 2018 and
	codigo in
		(select pedido from itens where produto in
			(select codigo from produto where nome = 'Tv LCD')))


/*Tabelas temporarias*/

select * 
into Pedido2018
from pedido
where datepart (yy,datapedido)=2018

select * from Pedido2018

/*view*/

create view clienteE as
Select nome, cidade
from cliente