/*a) Crie uma Stored Procedure que, passando como par�metro de entrada o t�tulo do evento, retorne como
par�metro de sa�da a quantidade de inscritos neste evento, apenas se o evento tiver sido realizado nos
�ltimos 03 anos. Se o evento tiver sido realizado nos �ltimos 03 anos, dever� ser emitida uma mensagem
mostrando �O Evento NOME aconteceu em DATA� e o par�metro de sa�da dever� ser retornado; Caso
contr�rio, dever� ser emitida uma mensagem mostrando �O evento NOME aconteceu h� X anos�, e o
par�metro de sa�da n�o deve retornar nenhum valor.*/
-
Create procedure QuestaoA
@TituloEventos varchar(30), @quantInscritos int output
as
 declare @dataEv datetime, @diferencaAnos int
 Select @dataEv = Max(data) from eventos Where titulo = @TituloEventos
 if (@diferencaAnos <= 3)
	begin
		select @quantInscritos = count(*) from eventos e join inscricoes i
			on e.codigo = i.evento where e.titulo = @TituloEventos
		print(O evento '+@tituloEvento + ' 'Aconteceu em ' + convert (varchar(15), datetime)))
	end
go

/*b) Crie um trigger para que, sempre que um participante da cidade de Porto Alegre for realizar inscri��o em
um evento, o valor da inscri��o tenha um desconto de 30%.*/
Create trigger QuestaoB
on inscricoes
for insert
as
If((select  nome
from cidade a join participantes pa on a.codigo = pa.cidade 
join inserted pa.cpf = i.participante ) = 'Porto Alegre ')

Update inscricoes
set valor = i valor - i.valor xc-3
from participantes join inserted on pa.cpf= i.participante
join inscricoes i on i.participante = in.eventos


/*c) Crie uma Stored Procedure que mostre os t�tulos dos eventos que tiveram mais do que 5 participantes de
determinado estado inscritos. O estado do participante deve ser o par�metro de entrada.*/
Create procedure QuestaoC
@TituloEventos varchar(30), @quantInscritos int output
as
 declare @dataEv datetime, @diferencaAnos int
 Select @dataEv = Max(data) from eventos Where titulo = @TituloEventos
 if (@diferencaAnos <= 3)
	begin
		select @quantInscritos = count(*) from eventos e join inscricoes i
			on e.codigo = i.evento where e.titulo = @TituloEventos
		print(O evento '+@tituloEvento + ' 'Aconteceu em ' + convert (varchar(15), datetime)))
end

/*d) Crie um Trigger que impe�a que sejam inseridos ou alterados eventos com palestrantes da empresa
Cisco.*/

create trigger QuestaoD
ON evento
for update
AS
	IF((select quant from inserted) = update)
		BEGIN
			ROLLBACK TRANSACTION
			RETURN
		END

insert into Evento
values(175,2,30,200,0)

select * from Itens