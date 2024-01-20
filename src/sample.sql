/*----------------------------------------------------------------------------------------------------------------------
	Sınıf Çalışması: Aşağıdaki tabloya göre ilgili soruları cevaplayınız
    employees
        citizen_id char(40)
        first_name
        middle_name
        last_name
        birth_date
        entry_date (default getdate)
    Sorular
        1. Parametresi ile aldığı doğum tarihi bilgisine göre aşağıdaki gibi Türkçe mesajlar döndüren get_birth_day_message_tr
        fonksiyonunu yazınız
            - Doğum günü geçmiş ise "Geçmiş doğum gününüz kutlu olsun. Yeni yaşınız: 56"
            - Doğum günü henüz gelmemiş ise "Doğum gününüz şimdiden kutlu olsun. Yeni yaşınız: 56"
            - Doğum günü o gün ise "Doğum gününün kutlu olsun. Yeni yaşınız: 56"

        2. Parametresi ile aldığı ay ve yıl bilgisine göre o ay ve yıl içerisinde işe girmiş olan kişileri tablo 
        olarak döndüren get_employees_by_month_and_year fonksiyonunu yazınız
-----------------------------------------------------------------------------------------------------------------------*/

create database companydb

go

use companydb

go

create table employees (
	citizen_id char(40),
	first_name nvarchar(100) not null,
	middle_name nvarchar(100),
	last_name nvarchar(100) not null,
	birth_date date not null,
	entry_date date default(getdate()) not null
)

go


-- 1
create function get_birth_date_message(@birth_date date)
returns nvarchar(300)
as
begin
	declare @today date = getdate()
	declare @birth_day date = datefromparts(datepart(year, @today), datepart(month, @birth_date), datepart(day, @birth_date))
	declare @age real = datediff(day, @birth_date, @today) / 365.
	
	declare @message nvarchar(300)

	if @today > @birth_day
		set @message = 'Geçmiş doğum gününüz kutlu olsun. Yeni yaşınız:'
	else if @today < @birth_day
		set @message = 'Doğum gününüz şimdiden kutlu olsun. Yeni yaşınız:'
	else 
		set @message = 'Doğum gününün kutlu olsun. Yeni yaşınız:'

	return @message	+ cast (@age as nvarchar(10))
end

go


-- 2
create function get_employees_by_month_and_year(@month int, @year int)
returns table
as
return (
	select * from employees where datepart(month, entry_date) = @month and datepart(year, entry_date) = @year
)
