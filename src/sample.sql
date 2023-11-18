/*----------------------------------------------------------------------------------------------------------------------
    Sınıf Çalışması: Aşağıdaki tabloları dbps23_schooldb veritabanında oluşturunuz ve soruları yanıtlayınız
    students
        - student_id
        - citizen_number
        - first_name
        - middle_name
        - last_name
        - birth_date
        - address
    lectures
        - lecture_code char(7)
        - name
        - credits
    grades
        - grade_id
        - description
        - value
    enrolls
        - enroll_id
        - student_id
        - lecture_code
        - grade_id

  Harf notları ve karşılık gelen değerler aşağıdaki gibi olabilir
    AA -> 4.0
    BA -> 3.5
    BB -> 3.0
    CB -> 2.5
    CC -> 2.0
    DC -> 1.5
    DD -> 1.0
    FF -> 0.0
    NA -> -1
    P  -> -1
  Sorular:
  1. Parametresi ile aldığı ders kodu için öğrencilerin sayısını notlara göre gruplayarak getiren sorguya geri
  dönen fonksiyonu yazınız

  2. Kredi toplamları parametresi ile aldığı değerden büyük olan öğrencilerin bilgilerine geri dönen fonksiyonu yazınız

  3. Her bir dersi alan öğrencilerin sayısını veren sorguyu yazınız

  3. Dersi, parametresi ile aldığı sayıdan fazla kez alan öğrencilerin kayıt olduğu dersleri gruplayan fonksiyonu yazınız

  4. Dersi, parametresi ile aldığı sayıdan fazla kez alan öğrencilerin kayıt olduğu derslerin not ortalamasını getiren fonksiyonu
  yazınız

  5. Bir dersin açılabilmesi için belli sayıda öğrencinin olması gerektiği durumda açılması için gereken minimum
    öğrenci sayısını parametre olarak alan ve açılabilen dersleri getiren fonksiyonu yazınız
-----------------------------------------------------------------------------------------------------------------------*/

create database dbps23_schooldb

go

use dbps23_schooldb


go

create table students (
    student_id int primary key identity(1, 1),
    citizen_number char(40) unique not null,
    first_name nvarchar(100) not null,
    middle_name nvarchar(100),
    last_name nvarchar(100) not null,
    birth_date date not null,
    address nvarchar(max) not null
)

create table lectures (
    lecture_code char(7) primary key,
    name nvarchar(200) not null,
    credits int default(0) check(credits >= 0) not null
)

create table grades (
    grade_id int primary key identity(1, 1),
    description char(2) not null,
    value real not null
)

go

insert into grades (description, value) 
values ('AA', 4.0), ('BA', 3.5), ('BB', 3.0), ('CB', 2.5), ('CC', 2.0),('DC', 1.5), ('DD', 1.0), ('FF', 00), ('NA', -1), ('P', -1)

go

create table enrolls (
    enroll_id bigint primary key identity(1, 1),
    student_id int foreign key references students(student_id) not null,
    lecture_code char(7) foreign key references lectures(lecture_code) not null,    
    grade_id int foreign key references grades(grade_id) not null
)

go
-- 1.
create function get_number_of_students_grades_by_lecture_code(@lecture_code char(7))
returns table
as
return (
    select g.description as grade, count(*) as count
    from enrolls e inner join grades g on e.grade_id = g.grade_id
    where e.lecture_code = @lecture_code group by g.description
)

go

select * from dbo.get_number_of_students_grades_by_lecture_code('BIM 101')