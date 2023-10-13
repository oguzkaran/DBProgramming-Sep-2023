-- ddl.sql
-- Version 1.0.0

create database dps23_veterinerian_hospital_db;

create table veterinarians (
	diploma_no bigint primary key,
	first_name varchar(100) not null,
	middle_name varchar(100),
	last_name varchar(100) not null,
	birth_date date not null,
	entry_date date not null	
);

create table owners (
	owner_id bigserial primary key,
	name varchar(200) not null,
	address varchar(512) not null
);

create table phone_types (
	phone_type_id serial primary key,
	description varchar(50) not null
);

insert into phone_types (description) values ('GSM'), ('HOME'), ('WORK'), ('OTHER');

create table phones (
	phone_id bigserial primary key,
	phone_type_id int references phone_types(phone_type_id) not null,
	owner_id bigint references owners(owner_id) not null,
	phone char(14) not null
);


create table animals (
	animal_id bigserial primary key,
	owner_id bigint references owners(owner_id) not null,
	name varchar(200),
	birth_date date,
	description varchar(512)	
);

create table veterinarian_to_animals (
	veterinarian_to_animal_id bigserial primary key,
	diploma_no bigint references veterinarians(diploma_no) not null,
	animal_id bigint references animals(animal_id) not null,
	description text	
);

create table veterinarian_to_animal_prices (
	veterinarian_to_animal_price_id bigserial primary key,
	veterinarian_to_animal_id bigint references veterinarian_to_animals(veterinarian_to_animal_id) not null,
	price real check(price >= 0.0) default(0.0),
	description varchar(256)
);
