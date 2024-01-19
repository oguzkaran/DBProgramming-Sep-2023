/*----------------------------------------------------------------------------------------------------------------------
	Sınıf Çalışması: Basit bir çoktan seçmeli sınava (yarışmaya) ilişkin aşağıdaki veritabanını oluşturunuz ve ilgili
	soruları cevaplayınız
		questions:
			- question_id
			- description
			- level_id			
		options:
			- option_id
			- description
			- question_id
			- is_answer
		levels
			- level_id
			- description
		Sorulan seçenek sayısı değişebilecektir
	Sorular:
	1. Her çağrıldığında herhangi bir seviyeden rasgele bir soru getiren sorgu
	2. Parametresi ile aldığı level_id bilgisine göre rasgele bir soru getiren sorgu
	3. Parametresi ile aldığı question_id'ye göre ilgili sorunun doğru cevaplarını getiren sorgu
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