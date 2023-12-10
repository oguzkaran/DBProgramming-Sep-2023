create database car_service_center_db;

create table manufacturers (
	manufacturer_id serial primary key,
	name varchar(50) not null,
	details text not null
);

create table models (
	model_id serial primary key,
	manufacturer_id int references manufacturers(manufacturer_id) not null,
	name varchar(50) not null,
	engine_size varchar(10) not null
);

create table address_types (
	address_type_id serial primary key,
	description varchar(50) unique not null
);

insert into address_types(description) values ('Home'), ('Work'), ('School');

create table addresses (
	address_id bigserial primary key,
	address_type_id int references address_types(address_type_id),
	city varchar(50) not null,
	state varchar(50) not null,
	address_line varchar(150) not null
);

create table phone_types (
	phone_type_id serial primary key,
	description varchar(50) unique not null
);

insert into phone_types(description) values ('Mobile'), ('Home'), ('Work');

create table phone_numbers (
	phone_number_id bigserial primary key,
	phone_type_id int references phone_types(phone_type_id) not null,
	number char(11) not null
);

create table genders (
	gender_id serial primary key,
	description varchar(50) unique not null
);

insert into genders(description) values ('Female'), ('Male'), ('Other');

create table customers (
	customer_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	gender_id int references genders(gender_id) not null,
	title varchar(50) not null,
	email varchar(100) not null,
	phone_number_id bigint references phone_numbers(phone_number_id) not null,
	address_id bigint references addresses(address_id) not null,
	details text
);

create table cars (
	licence_number int primary key,
	customer_id int references customers(customer_id) not null,
	model_id int references models(model_id) not null,
	details text
);

create table bookings (
	booking_id serial primary key,
	licence_number int references cars(licence_number) not null,
	entry_time timestamp not null,
	entrance_milage bigint not null,
	exit_time timestamp not null,
	exit_milage bigint not null,
	payment_received boolean not null,
	details text
);

create table mechanics (
	mechanic_id serial primary key,
	name varchar(100) not null,
	details varchar(100)
);

create table bookings_to_mechanics (
	booking_to_mechanic_id bigserial primary key,
	booking_id int references bookings(booking_id) not null,
	mechanic_id int references mechanics(mechanic_id) not null
);