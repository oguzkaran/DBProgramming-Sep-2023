-- ddl.sql

create database dps23_veterinerian_hospital_db

use dps23_veterinerian_hospital_db

create table veterinarians (
	diploma_no bigint primary key,
	first_name nvarchar(100) not null,
	middle_name nvarchar(100),
	last_name nvarchar(100) not null,
	birth_date datetime not null,
	entry_date datetime not null	
)

create table owners (
	owner_id bigint identity(1, 1) primary key,
	name nvarchar(200) not null,
	address nvarchar(max) not null
)

create table phone_types (
	phone_type_id int identity(1, 1) primary key,
	description nvarchar(50) not null
)

insert into phone_types (description) values ('GSM'), ('HOME'), ('WORK'), ('OTHER')

create table phones (
	phone_id bigint identity(1, 1) primary key,
	phone_type_id int foreign key references phone_types(phone_type_id) not null,
	owner_id bigint foreign key references owners(owner_id) not null,
	phone char(14) not null
)


create table animals (
	animal_id bigint identity(1, 1) primary key,
	owner_id bigint foreign key references owners(owner_id) not null,
	name nvarchar(200),
	birth_date datetime,
	description nvarchar(max)	
)

create table veterinarian_to_animals (
	veterinarian_to_animal_id bigint identity(1, 1) primary key,
	diploma_no bigint foreign key references veterinarians(diploma_no) not null,
	animal_id bigint foreign key references animals(animal_id) not null,
	description text	
)

create table veterinarian_to_animal_prices (
	veterinarian_to_animal_price_id bigint identity(1, 1) primary key,
	veterinarian_to_animal_id bigint foreign key references veterinarian_to_animals(veterinarian_to_animal_id) not null,
	price real check(price >= 0.0) default(0.0),
	description nvarchar(256)
)

