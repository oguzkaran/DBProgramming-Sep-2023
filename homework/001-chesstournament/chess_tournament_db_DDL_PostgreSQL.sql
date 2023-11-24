create database dbps23_chess_tournament_db

create table player_rankings (
	player_ranking_code serial primary key,
	description varchar(250)
);

create table clubs (
	club_id serial primary key,
	name varchar(100),
	address varchar(250),
	details text
);

create table players (
	player_id serial primary key,
	club_id int references clubs(club_id) not null,
	ranking_code int references player_rankings(player_ranking_code) not null,
	name varchar(50),
	surname varchar(50),
	address varchar(250),
	phone char(11),
	email varchar(100),
	details text
);

create table organizers (
	organizer_id serial primary key,
	organizer_name varchar(100),
	details text 
);

create table clubs_to_organizers (
	club_to_organizer_id serial primary key,
	club_id int references clubs(club_id) not null,
	organizer_id int references organizers(organizer_id) not null
);

create table tournaments (
	tournament_id serial primary key,
	organizer_id int references organizers(organizer_id) not null,
	start_date date,
	end_date date,
	name varchar(100),
	details text
);

create table player_participation (
	player_participation_id serial primary key, 
	player_id int references players(player_id) not null,
	tournament_id int references tournaments(tournament_id) not null,
	final_result int
);

create table match_results (
	match_result_code int primary key,
	description varchar(250)
);

insert into match_results (match_result_code, description) values (0, 'Draw.'), (1, 'Player 1 win.'), (2, 'Player 2 win.');

create table matches (
	match_id serial primary key,
	tournament_id int references tournaments(tournament_id) not null,
	player1_id int references players(player_id) not null,
	player2_id int references players(player_id) not null,
	match_start_datetime timestamp,
	result_code int,
	match_end_datetime timestamp
);

create table sponsors (
	sponsor_id serial primary key,
	name varchar(75),
	phone char(11),
	details text
);

create table tournament_sponsors (
	tournament_sponsor_id serial primary key,
	tournament_id int references tournaments(tournament_id) not null,
	sponsor_id int references sponsors(sponsor_id) not null
);