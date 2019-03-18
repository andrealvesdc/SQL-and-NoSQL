/*Assunro T_SQL*/

begin
/*Declara variaveis*/
declare @nome varchar(50), @codigo int,
	@data datetime

/*Atribui valores*/
Set @nome = (select nome from cliente where codigo = 1)
select @codigo = codigo from cliente where nome = 'Larissa Maia'
Select @data = getdate()

/*Ver os valores das variaveis*/
Select @nome, @codigo, @data
end


/*Condições*/
create procedure testeif
@nomecli varchar(50)
as
	declare @somaprod = SUM (pr.venda) from produto pr join itens i
	on pr.codigo = i.produto join pedido pe on pe.codigo = i.pedido
	join cliente c on c.codigo = pe.cleinete where c.nome = @nomecli
if(@somaprod > 10000)
	print('cliente vip')
else
	if(@somaprod between 5000 and 10000)
	print ('Cliente normal')
else 
	print('Cliente popular')


exec testif 'Larissa Maia'