/*----------------------------------------------------------------------------------------------------------------------
	İçiçe try deyimlerinde içteki catch bloğunda işlemm yapıldıktan sonra tekrar aynı error'un fırlatılması için throw
	tek başına kullanılır. Buna yeniden fırlatma (rethrow) denir. Bu durumda sentaks olarak throw'dan önce gelen deyimin
	noktalı virgül ile sonlandırılması gerekir
-----------------------------------------------------------------------------------------------------------------------*/

declare @val int = rand()* 20 - 10

begin try
	begin try
		if @val < 0
			throw 67000, 'Can not be negative', 1
		select @val
	end try
	begin catch
		select 'inner catch';
		throw --rethrow
	end catch
end try
begin catch
	select 'outer catch'
end catch