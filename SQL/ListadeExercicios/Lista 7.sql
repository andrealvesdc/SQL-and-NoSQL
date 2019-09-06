/*a) Crie um trigger que lance uma mensagem de alerta sempre que um pedido de valor maior que R$
50 for realizado. Teste o seu trigger.*/
create trigger valorPedido
ON itens
for insert
AS
	IF ((select preco from inserted) > 50)
		print('Preço > R$50')
	ELSE
		print('Preço < R$50')

insert into itens
values(70,1,80,2,0)

/*b) Crie um trigger para que, sempre ao realizar a atualização do dado de algum funcionário, atualizar
os salários dos funcionários de uma determinada função, para que seja o valor do salário + o valor
da gratificação da função. Teste o seu trigger.*/
create trigger attSal
ON funcionario
for update
AS
	 update Funcionario
	 set salario = i.salario + fun.gratific
	 from Funcao fun JOIN inserted i ON fun.codigo = i.funcao JOIN Funcionario f ON f.codigo = i.codigo

update Funcionario
set estcivil = 'S'
where codigo = 2

select * from Funcionario

/*c) Crie um trigger que impeça que sejam inseridos ou alterados itens de venda com o valor para o
campo quantidade maior que 100. Teste o seu trigger.*/
create trigger vendaValor
ON itens
for insert, update
AS
	IF((select quant from inserted) > 100)
		BEGIN
			print('qunatidade > 100 - Linha não inserida')
			ROLLBACK TRANSACTION
			RETURN
		END

insert into itens
values(175,2,30,200,0)

select * from Itens

/*d) Crie um trigger para testar se, ao realizar uma venda, a quantidade comprada de um determinado
produto não seja maior que a quantidade em estoque deste produto. Caso isso aconteça, deverá
ser emitida uma mensagem de alerta. Teste o seu trigger.*/
create trigger controlaEstoque
ON itens
for insert
AS
	IF(select quant from inserted) > (select pr.quantEst from produto pr JOIN inserted i ON pr.codigo = i.produto)
	BEGIN
		print ('Venda não realizada - Não temos este produto no estoque no momento')
		ROLLBACK TRANSACTION
		RETURN
	END
	ELSE
		print('pedido realizado')

insert into itens
values(175,3,100,50,0)