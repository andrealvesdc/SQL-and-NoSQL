/* create database SCP */

/*a) Exibir código, nome, salário e 
o salário com 30% de aumento para todos os funcionários. */
select codigo, nome, salario, (salario+(salario*0.3))
from funcionario

/*b) Exibir código, nome, preço de custo, preço de venda e
 a diferença entre estes dois preços para todos os produtos.*/
select codigo, nome, custo, venda, (venda-custo) as 'Custo-venda'
 from produto 

/*c) Exibir os 3 primeiros clientes cadastrados.*/
select top 3 nome 
from cliente

/*d) Exiba o nome do funcionário e o nome mês do seu aniversário.*/
select nome, datename(mm,datanasc) as 'Mês de Aniversário'
from funcionario

/*e) Mostre os 50% primeiros pedidos cadastrados.*/
select top 50 percent codigo as CodigoDoPedido 
from pedido

/*f) Mostre a descrição, preço de custo e
preço de venda arredondados para 1 casa decimal,
de todos os produtos.*/
select descricao, round(custo,1), round(venda,1) 
from produto

/*g) Mostre o primeiro caractere das siglas dos
setores existentes na empresa, tudo em minúsculo.*/
select lower(substring(sigla,1,1))
from setor

/*h) Mostre os pedidos realizados nos últimos 200 dias.*/
select * from pedido 
where datediff(dd,datapedido,getdate()) <= 200

/*i) Exibir a data do pedido mais recente*/
select max(datapedido) as 'Pedido mais recente'
from pedido

/*j) Mostre o preço de todos os itens elevados a 3. */
select power(preco,3) from itens

/*k) Mostre a média de salários dos funcionários.*/
select avg(salario) as 'Média salários' 
from funcionario

/*l) Mostre quantos pedidos foram realizados.*/
select count(*) as 'Quantidade de pedidos'
from pedido

/*m) Mostre quantos funcionários tem e-mail.*/
select count(email) as 'Funcionarios com e-mail'
from funcionario