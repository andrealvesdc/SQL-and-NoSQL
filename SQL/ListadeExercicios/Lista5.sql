/*a) Crie uma Stored Procedure que, passando como parâmetro de entrada o nome do cliente, mostre
como parâmetro de saída a quantidade de pedidos que este cliente realizou no ano de 2012.*/
CREATE PROCEDURE QA 
@nomeCli varchar(50), @quantPed int OUTPUT
AS
SELECT @quantPed = count(*)
FROM pedido pe JOIN Cliente cl ON pe.cliente = cl.codigo
WHERE @nomeCli = cl.nome AND DATEPART(yy,pe.dataPedido) = 2012

declare @quantPed int
EXEC QA 'Maria Helena Ferreira', @quantPed OUTPUT
select @quantPed

/*b) Crie uma Stored Procedure que receba o código do cliente como parâmetro de entrada, e imprima
seus dados da seguinte maneira:
**** Clientes da Loja ****
==================
Nome do Cliente: Larissa Maia
Estado: PB
Tipo de Cliente: PF
Data de Hoje: 14/03/2019*/

ALTER PROCEDURE QB
@codCli int
AS
DECLARE @nome varchar(50), @estado varchar(2), @tipo varchar(2), @data datetime

SELECT @nome = c.nome, @estado = ci.uf, @tipo = c.tipo, @data = getdate()
from cliente c JOIN cidade ci ON c.cidade = ci.codigo
where c.codigo = @codCli

print ('*** Clientes da Loja ***')
print ('========================')
print ('Nome do Cliente: ' + @nome)
print ('Estado: ' + @estado)
print ('Tipo de Cliente: ' + @tipo)
print ('Data de Hoje: ' + convert(varchar(20),@data))

EXEC QB 5

/*c) Crie uma Stored Procedure que, passando como parâmetro de entrada o código do produto, mostre
os nomes dos funcionários que venderam este produto, apenas se a compra do produto tiver sido rea-
lizada em 2016. Caso contrário, deverá ser emitida uma mensagem.*/
ALTER PROCEDURE QC
@codProd int
AS
IF((select pe.dataPedido
	from pedido pe JOIN itens i ON pe.codigo = i.pedido JOIN produto pr ON pr.codigo = i.produto
	where pr.codigo = @codProd)
	between '01-01-2016' AND '31-12-2016')

		select  f.nome 
		FROM Funcionario f JOIN pedido pe ON f.codigo = pe.vendedor JOIN itens i ON pe.codigo = i.pedido JOIN produto pr ON pr.codigo = i.produto
		where pr.codigo = @codProd

ELSE
	print('Este produto não foi comprado em 2016')

	EXEC QC 1

