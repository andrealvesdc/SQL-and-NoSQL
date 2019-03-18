/*a) Crie uma Stored Procedure que, passando como par�metro o c�digo do funcion�rio, mostre todas as datas
dos pedidos que foram realizados por este funcion�rio.*/
create procedure QA
@codfunc int
AS
select datapedido
from pedido
where vendedor = @codfunc

EXEC QA 3


/*b) Crie uma Stored Procedure, que passando como par�metro o c�digo do pedido, mostre o nome do cliente que
fez este pedido, o nome e o pre�o de venda do produto comprado e a data do pedido, apenas se o pedido foi
realizado no ano de 2014.*/
create procedure QB
@codped int 
as
select c.nome, p.nome as produto, p.venda, pe.datapedido
from Cliente c join Pedido pe on c.codigo = pe.cliente join Itens i on i.pedido = pe.codigo join Produto p on p.codigo = i.produto
where pe.codigo = @codped and datepart(yy,dataPedido) = 2014

/*c) Crie uma Stored Procedure que mostre para cada funcion�rio passado como par�metro de entrada, o nome
da cidade e do pa�s que ele nasceu. Passe como par�metro de entrada o nome do funcion�rio.*/
create procedure QC
@nomefunc varchar(50) 
as
select c.nome, c.Pais
from Funcionario f join Cidade c on f.cidade = c.codigo
where f.nome = @nomefunc

exec QC 'Jo�o Paulo'


/*d) Crie uma Stored Procedure que passando como par�metros de entrada o nome do cliente e o ano do pedido,
mostre como par�metro de sa�da a quantidade de pedidos que o cliente realizou neste determinado ano.*/
create procedure QD 
@nomeCli varchar(50), @anoPed int, @quantPed int OUTPUT
AS
select @quantPed = count(*)
from cliente c JOIN pedido p ON c.codigo = p.cliente
where c.nome = @nomeCli AND DATEPART(yy,p.dataPedido) = @anoPed

DECLARE @quantPed int
EXEC QD 'Larissa Maia', 2014, @quantPed OUTPUT
select @quantPed

/*e) Crie uma Stored Procedure que retorne como par�metro de sa�da o nome do funcion�rio mais velho.*/
create procedure QE
@nomeFunc varchar(50) OUTPUT
AS
select @nomeFunc = nome
from Funcionario
where datanasc = (select min (datanasc) from Funcionario)

declare @nomeFunc varchar(50)
EXEC QE @nomeFunc OUTPUT
select @nomeFunc

/*f) Crie uma Stored Procedure que tenha como par�metro de entrada o nome da fun��o, e mostre os nomes e
cidades dos funcion�rios que exercem esta fun��o.*/
create procedure QF
@funcao varchar(50) as
select f.nome, c.nome as cidade
from Funcionario f join Cidade c on f.cidade = c.codigo join Funcao fu on fu.codigo = f.funcao 
where fu.nome = @funcao

exec QF 'Gerente'
