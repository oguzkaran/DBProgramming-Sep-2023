/*----------------------------------------------------------------------------------------------------------------------
	Sınıf Çalışması: Aşağıdaki veritabanını oluşturunuz ve soruları cevaplayınız
	cities
		- city_id
		- name
	patients
		- patient_id
		- full_name
		- city_id
		- birth_date
	relations
		- relation_id 
		- description (Mother, Dad, Child, Aunt, Uncle etc)
	companions
		- companion_id
		- full_name
		- patient_id,
		- relation_id
	Sorular:
	1. Tüm patient_id'lere ilişkin hastaların isimlerini büyük harfe çeviren SP'yi yazınız
	2. Parametresi ile aldığı yaştabn büyük olan hastaların refaakçi ve kendi isimlerini büyük harfe çeviren SP'yi
	yazınız
	3. Parametresi ile aldığı city_id değerine göre refakatçi isimlerini küçük harfe çeviren SP'yi yazınız
-----------------------------------------------------------------------------------------------------------------------*/
create table staff (
	staff_id int primary key identity(1, 1),
	citizen_id char(40) unique not null,
	first_name nvarchar(100) not null,
	last_name nvarchar(100) not null,
	birth_date date not null,
	phone char(20) not null
)


go

create function get_random_staff_citizen_id()
returns char(40)
as
begin
	declare @bound int = (select count(*) from staff) + 1
	declare @min int = 1

	declare @index int = floor(rand() * (@bound - @min) + @min)
	declare crs_staff cursor scroll for select citizen_id from staff 
	open crs_staff 

	declare @citizen_id char(40) = ''

	fetch absolute @index from crs_staff into @citizen_id

	close crs_staff
	deallocate crs_staff

	return @citizen_id
end

go


declare @citizen_id char(40)

exec sp_fill_random_staff @citizen_id output

select * from staff where citizen_id = @citizen_id