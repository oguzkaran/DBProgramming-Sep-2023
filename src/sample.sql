/*----------------------------------------------------------------------------------------------------------------------
	Sınıf Çalışması: Aşağıdaki tabloları hazırlayınız ve ilgili soruları yanıtlayınız
	people
		- citizen_id char(11)
		- first_name varchar(100)
		- last_name varchar(100)
		- birth_date
		
	people_younger
		- citizen_id char(11)
		- first_name varchar(100)
		- last_name varchar(100)
		- birth_date
		
	people_older
		- citizen_id char(11)
		- first_name varchar(100)
		- last_name varchar(100)
		- birth_date
		
	Sorular
	1. Parametresi ile aldığı person bilgilerinde yaşı 18'den büyük 65'den küçük olanları people tablosuna, yaşı 18'den
	küçük olanları people_younger tablosuna ve yaşı 65'den büyük olanları people_older tablosuna ekleyen stored procedure'ı (SP)
    yazınız. 

	2. Parametresi ile aldığı yaşa göre o yaştaki kişileri tablo olarak döndüren get_people_by_age fonksiyonunu
	yazınız. Fonksiyonun parametresi olan age bilgisi tamsayı olarak bildirilecektir
-----------------------------------------------------------------------------------------------------------------------*/

create database dps23_peopledb;

go


use dps23_peopledb

go

create table people (
	citizen_id char(11) primary key,
	first_name nvarchar(100) not null,
	last_name nvarchar(100) not null,
	birth_date date not null
)

go

create table people_younger (
	citizen_id char(11) primary key,
	first_name nvarchar(100) not null,
	last_name nvarchar(100) not null,
	birth_date date not null
)

go

create table people_older (
	citizen_id char(11) primary key,
	first_name nvarchar(100) not null,
	last_name nvarchar(100) not null,
	birth_date date not null
)

go

create function get_age(@birth_date date) 
returns real
as
begin
    return datediff(day, @birth_date, getdate()) / 365.
end

go

create function get_age_by_reference_date(@birth_date date, @reference_date date) 
returns real
as
begin
    return datediff(day, @birth_date, @reference_date) / 365.
end

go
create procedure sp_insert_person(@citizen_id char(11), @first_name nvarchar(100), @last_name nvarchar(100), @birth_date date)
as
begin
    declare @age real = dbo.get_age(@birth_date)

    if @age < 18
        insert into people_younger (citizen_id, first_name, last_name, birth_date) values (@citizen_id, @first_name, @last_name, @birth_date)        
    else if @age < 65 
        insert into people (citizen_id, first_name, last_name, birth_date) values (@citizen_id, @first_name, @last_name, @birth_date)
    else 
        insert into people_older (citizen_id, first_name, last_name, birth_date) values (@citizen_id, @first_name, @last_name, @birth_date)
end

go

exec sp_insert_person '12345678924', 'Oğuz', 'Karan', '1976-09-10' 
exec sp_insert_person '12345678926', 'Deniz', 'Karan', '2021-09-06' 
exec sp_insert_person '12345678928', 'Atilla', 'Karan', '1945-03-22' 

select * from people_younger

go


create function get_people_by_age(@age int)
returns table
as
return (
    select citizen_id, first_name + ' ' + last_name as name, birth_date, dbo.get_age(birth_date) as age from people where dbo.get_age(birth_date) = @age        
)
        
go


select first_name, last_name, birth_date from people
union
select first_name, last_name, birth_date from people_younger
union 
select first_name, last_name, birth_date from people_older

select first_name, last_name, birth_date from people
union all
select first_name, last_name, birth_date from people_younger
union all
select first_name, last_name, birth_date from people_older

select first_name, last_name, birth_date from people
intersect
select first_name, last_name, birth_date from people_younger
intersect
select first_name, last_name, birth_date from people_older

select first_name, last_name, birth_date from people
except
select first_name, last_name, birth_date from people_younger
except
select first_name, last_name, birth_date from people_older
