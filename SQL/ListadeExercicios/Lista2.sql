/* create database SCP */

/* a) Exibir c�digo e nome de todos os funcion�rios que tenham �Silva� em qualquer parte do
nome */
select codigo, nome
from Funcionario
where nome like '%Silva%'

/* b) Exibir c�digo e nome de todos os funcion�rios que tenham o nome come�ado por �Mar�,
seguido de um caractere qualquer entre �i� e �t�, logo depois a vogal �a�, mais uma
seq��ncia qualquer de caracteres. */
select codigo, nome
from Funcionario
where nome like 'Mar[i-t]a%'

/*c) Exibir c�digo e nome de todos os clientes cujo nome n�o comece por �L� nem por �M�*/
select nome
from Cliente
where nome not like '[LM]%'

/*d) Exibir a quantidade de produtos vendidos com pre�o de venda maior que R$ 10,00.*/
select count (*) 'Q.produtos vendidos'
from produto pr, Itens i
where pr.codigo = i.produto
	and pr.venda > 10

/*com join*/
select count (*) 'Q.produtos vendidos'
from produto pr 
join Itens i on pr.codigo = i.produto
where pr.venda > 10

/*e) Mostre os nomes e as cidades que nasceram os funcion�rios que realizaram pedidos de
Liquidificador.*/
select f.nome, ci.nome
from Cidade ci join Funcionario f on ci.codigo = f.naturalidade
	join Pedido pe on f.codigo = pe.vendedor
	join Itens i on pe.codigo = i.pedido
	join Produto pr on pr.codigo = i.produto
where pr.nome = 'liquidificador'

/*f) Exiba nome e tipo dos clientes que foram atendidos por funcion�rios que n�o moram no
Bessa nem em Mana�ra.*/
select c.nome, c.tipo
from Cliente c join Pedido pe on c.codigo = pe.cliente
	join Funcionario f on f.codigo = pe.vendedor
where f.bairro not in ('Berssa','Manaira')

/*g) Mostre o nome dos funcion�rios que realizaram algum pedido para clientes com c�digo 1, 2
e 3.*/
select f.nome
from Pedido pe
	join Funcionario f on f.codigo = pe.vendedor
where pe.cliente in (1,2,3)


/*h) Exibir o c�digo do produto e a quantidade de pedidos feitos para cada produto.*/
select pr.codigo, count(*)
from produto pr join itens i on pr.codigo=i.produto
group by pr.codigo


/*i) Mostre o nome do produto e a soma dos pre�os de venda destes produtos comprados, para
cada produto que possui quantidade em estoque entre 10 e 100 itens.*/
select pr.nome, sum(pr.venda)
from produto pr join itens i on pr.codigo=i.produto
where pr.quantest between 10 and 100
group by pr.nome


/*j) Quais os nomes dos produtos que foram comprados por clientes pessoa f�sica no ano de
2016?*/
select pr.nome
from produto pr join itens i on pr.codigo=i.produto
	join pedido pe on pe.codigo=i.pedido
	join cliente c on c.codigo=pe.cliente
where c.tipo='PF' and datepart(yy,pe.datapedido) = 2016




/*Mostre, para cada cliente,  o seu nome e a quantidade de pedidos que cada um realizou.
Mostre apenas os clientes que realizaram masi do que 30 pedidos */
select c.nome, count(*)
from cliente c join pedido pe on c.codigo= pe.cliente
group by c.nome
having count(*) > 30 /*Asssunto novo*/



/*Assunto novo joins*/
select c.nome, ci.nome
from cliente c join cidade ci on ci.codigo =c.cidade

select c.nome, ci.nome
from cliente c right join cidade ci on ci.codigo =c.cidade

select c.nome, ci.nome
from cliente c left join cidade ci on ci.codigo =c.cidade


/*Sub consultas*/
select nome
from produto
where venda in (select max(venda)
			  from produto > 120)