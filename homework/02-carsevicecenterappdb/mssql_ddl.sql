create database car_service_center_db

go

use car_service_center_db

go

create table manufacturers (
	manufacturer_id int primary key identity(1, 1),
	name nvarchar(50) not null,
	details nvarchar(max) not null
)

go

create table models (
	model_id int primary key identity(1, 1),
	manufacturer_id int foreign key references manufacturers(manufacturer_id) not null,
	name nvarchar(50) not null,
	engine_size nvarchar(10) not null
)

go

create table address_types (
	address_type_id int primary key identity(1, 1),
	description nvarchar(50) unique not null
)

go

insert into address_types(description) values ('Home'), ('Work'), ('School')

go

create table addresses (
	address_id bigint primary key identity(1, 1),
	address_type_id int foreign key references address_types(address_type_id),
	city nvarchar(50) not null,
	state nvarchar(50) not null,
	address_line nvarchar(150) not null
)

go

create table phone_types (
	phone_type_id int primary key identity(1, 1),
	description nvarchar(50) unique not null
)

go

insert into phone_types(description) values ('Mobile'), ('Home'), ('Work')

go

create table phone_numbers (
	phone_number_id bigint primary key identity(1, 1),
	phone_type_id int foreign key references phone_types(phone_type_id) not null,
	number char(11) not null
)

go

create table genders (
	gender_id int primary key identity(1, 1),
	description nvarchar(50) unique not null
)

go

insert into genders(description) values ('Female'), ('Male'), ('Other')

go

create table customers (
	customer_id int primary key identity(1, 1),
	first_name nvarchar(50) not null,
	last_name nvarchar(50) not null,
	gender_id int foreign key references genders(gender_id) not null,
	title nvarchar(50) not null,
	email nvarchar(100) not null,
	phone_number_id bigint foreign key references phone_numbers(phone_number_id) not null,
	address_id bigint foreign key references addresses(address_id) not null,
	details nvarchar(max)
)

go

create table cars (
	licence_number int primary key,
	customer_id int foreign key references customers(customer_id) not null,
	model_id int foreign key references models(model_id) not null,
	details nvarchar(max)
)

go

create table bookings (
	booking_id int primary key identity(1, 1),
	licence_number int foreign key references cars(licence_number) not null,
	entry_time datetime not null,
	entrance_milage bigint not null,
	exit_time datetime not null,
	exit_milage bigint not null,
	payment_received bit not null,
	details nvarchar(max)
)

go

create table mechanics (
	mechanic_id int primary key identity(1, 1),
	name nvarchar(100) not null,
	details nvarchar(100)
)

go

create table bookings_to_mechanics (
	booking_to_mechanic_id bigint primary key identity(1, 1),
	booking_id int foreign key references bookings(booking_id) not null,
	mechanic_id int foreign key references mechanics(mechanic_id) not null
)