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
		
	Soru:
	- Insert işleminde aşı 18'den büyük 65'den küçük olanları people tablosuna, yaşı 18'den küçük olanları people_younger 
	tablosuna ve yaşı 65'den büyük olanları people_older tablosuna ekleyen trigger'ları yazınız    	
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


go

create trigger t_insert_person_instead_of_for_people on people
instead of insert
as
begin
    declare @age real = dbo.get_age((select birth_date from inserted))

    if @age < 18
        insert into people_younger (citizen_id, first_name, last_name, birth_date) (select citizen_id, first_name, last_name, birth_date from inserted)
    else if @age < 65 
		insert into people (citizen_id, first_name, last_name, birth_date) (select citizen_id, first_name, last_name, birth_date from inserted)
    else 
        insert into people_older (citizen_id, first_name, last_name, birth_date) (select citizen_id, first_name, last_name, birth_date from inserted)
end

go

create trigger t_insert_person_instead_of_for_people_younger on people_younger
instead of insert
as
begin
    declare @age real = dbo.get_age((select birth_date from inserted))

    if @age < 18
        insert into people_younger (citizen_id, first_name, last_name, birth_date) (select citizen_id, first_name, last_name, birth_date from inserted)
    else if @age < 65 
		insert into people (citizen_id, first_name, last_name, birth_date) (select citizen_id, first_name, last_name, birth_date from inserted)
    else 
        insert into people_older (citizen_id, first_name, last_name, birth_date) (select citizen_id, first_name, last_name, birth_date from inserted)
end

go

create trigger t_insert_person_instead_of_for_people_older on people_older
instead of insert
as
begin
    declare @age real = dbo.get_age((select birth_date from inserted))

    if @age < 18
        insert into people_younger (citizen_id, first_name, last_name, birth_date) (select citizen_id, first_name, last_name, birth_date from inserted)
    else if @age < 65 
		insert into people (citizen_id, first_name, last_name, birth_date) (select citizen_id, first_name, last_name, birth_date from inserted)
    else 
        insert into people_older (citizen_id, first_name, last_name, birth_date) (select citizen_id, first_name, last_name, birth_date from inserted)
end

insert into people_younger (citizen_id, first_name, last_name, birth_date) values ('12345678920', 'Oğuz', 'Karan', '1976-09-10')

go

select * from people_younger



    