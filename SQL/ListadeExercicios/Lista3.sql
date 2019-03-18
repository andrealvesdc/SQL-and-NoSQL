/*create database SCP*/

/*use SCP*/

/*a) Exibir o código do produto e a quantidade de pedidos feitos para os
 produtos que foram pedidos mais do que 10 vezes.*/

select pr.codigo, count(*)
from produto pr join itens i
	on pr.codigo = i.produto
group by pr.codigo
having count(*) >10

/*b) Mostre o nome do produto e a soma dos preços de venda destes produtos comprados, que
possuem quantidade em estoque entre 10 e 100 itens, apenas para os produtos cuja esta
soma seja maior do que R$5000,00.*/

select pr.nome, sum(i.preco)
from produto pr join itens i
	on pr.codigo = i.produto
where pr.quantest between 10 and 100
group by pr.nome
having sum(i.preco) > 5000

/*c) Exiba o nome do funcionário mais velho.*/
select nome 
from funcionario
where datanasc = (select  min (datanasc) from funcionario)

/*d) Exibir código, nome e preço de venda do produto mais caro vendido na empresa.*/
select pr.codigo, pr.nome, pr.venda
from produto pr join itens i
	on pr.codigo = i.produto
where pr.venda = (select  max (pr.venda) from produto pr)

/*e) Mostre o nome do funcionário que vendeu o produto mais barato.*/

select distinct f.nome
from funcionario f join pedido p
	on f.codigo = p.vendedor join itens i
	on i.pedido = p.codigo join produto pr
	on pr.codigo = i.produto
where pr.venda = (select min(pr.venda) from produto pr)


/*f) Quais os nomes e salários dos funcionários do sexo masculino que realizaram pedidos no
ano de 2013? (sub-consulta obrigatória)*/

select nome, salario
from funcionario
where sexo = 'M' and
	 codigo in (select vendedor 
	 from pedido
	 where datepart (yy,datapedido)=2013)

/*g) Crie uma nova tabela temporária com os nomes dos produtos comprados
 entre janeiro e junho de 2012, e a diferença entre o seu preço de venda e custo.*/
select pr.nome
into #ProdutosComprado
from produto pr join itens i on i.produto = pr.codigo join pedido pe on i.pedido = pe.codigo
where pe.dataPedido between '01/01/2012' and '30/06/2012'

/*h) Qual o nome do cliente que mais realizou pedidos no ano de 2016? (DESAFIO)*/
select c.nome, count(*) as Qtd
into #Result
from cliente c join pedido pe
	on c.codigo = pe.cliente
where datepart (yy,pe.dataPedido) = 2016
group by c.nome

select * 
from #Result

select nome
from #Result
where Qtd =
(select max(Qtd)
from #Result)

/*i) Crie uma View que mostre os nomes e salários dos funcionários do sexo
 masculino que realizaram pedidos no ano de 2015.*/

create view clienteE as
select nome, salario
from funcionario
where sexo = 'M' and
	 codigo in (select vendedor 
	 from pedido
	 where datepart (yy,datapedido)=2015)