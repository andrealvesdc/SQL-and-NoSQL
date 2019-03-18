/* create database SCP */

/*a) Exibir c�digo, nome, sal�rio e 
o sal�rio com 30% de aumento para todos os funcion�rios. */
select codigo, nome, salario, (salario+(salario*0.3))
from funcionario

/*b) Exibir c�digo, nome, pre�o de custo, pre�o de venda e
 a diferen�a entre estes dois pre�os para todos os produtos.*/
select codigo, nome, custo, venda, (venda-custo) as 'Custo-venda'
 from produto 

/*c) Exibir os 3 primeiros clientes cadastrados.*/
select top 3 nome 
from cliente

/*d) Exiba o nome do funcion�rio e o nome m�s do seu anivers�rio.*/
select nome, datename(mm,datanasc) as 'M�s de Anivers�rio'
from funcionario

/*e) Mostre os 50% primeiros pedidos cadastrados.*/
select top 50 percent codigo as CodigoDoPedido 
from pedido

/*f) Mostre a descri��o, pre�o de custo e
pre�o de venda arredondados para 1 casa decimal,
de todos os produtos.*/
select descricao, round(custo,1), round(venda,1) 
from produto

/*g) Mostre o primeiro caractere das siglas dos
setores existentes na empresa, tudo em min�sculo.*/
select lower(substring(sigla,1,1))
from setor

/*h) Mostre os pedidos realizados nos �ltimos 200 dias.*/
select * from pedido 
where datediff(dd,datapedido,getdate()) <= 200

/*i) Exibir a data do pedido mais recente*/
select max(datapedido) as 'Pedido mais recente'
from pedido

/*j) Mostre o pre�o de todos os itens elevados a 3. */
select power(preco,3) from itens

/*k) Mostre a m�dia de sal�rios dos funcion�rios.*/
select avg(salario) as 'M�dia sal�rios' 
from funcionario

/*l) Mostre quantos pedidos foram realizados.*/
select count(*) as 'Quantidade de pedidos'
from pedido

/*m) Mostre quantos funcion�rios tem e-mail.*/
select count(email) as 'Funcionarios com e-mail'
from funcionario