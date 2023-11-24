create database dbps23_chess_tournament_db

go

use dbps23_chess_tournament_db

go

create table player_rankings (
	player_ranking_code int primary key identity(1, 1),
	description nvarchar(250)
)

go

create table clubs (
	club_id int primary key identity(1, 1),
	name nvarchar(100),
	address nvarchar(250),
	details nvarchar(max)
)

go

create table players (
	player_id int primary key identity(1, 1),
	club_id int foreign key references clubs(club_id) not null,
	ranking_code int foreign key references player_rankings(player_ranking_code) not null,
	name nvarchar(50),
	surname nvarchar(50),
	address nvarchar(250),
	phone char(11),
	email nvarchar(100),
	details nvarchar(max)
)

go

create table organizers (
	organizer_id int primary key identity(1, 1),
	organizer_name nvarchar(100),
	details nvarchar(max) 
)

go

create table clubs_to_organizers (
	club_to_organizer_id int primary key identity(1, 1),
	club_id int foreign key references clubs(club_id) not null,
	organizer_id int foreign key references organizers(organizer_id) not null
)

go

create table tournaments (
	tournament_id int primary key identity(1, 1),
	organizer_id int foreign key references organizers(organizer_id) not null,
	start_date date,
	end_date date,
	name nvarchar(100),
	details nvarchar(max)
)

go

create table player_participation (
	player_participation_id int primary key identity(1, 1), 
	player_id int foreign key references players(player_id) not null,
	tournament_id int foreign key references tournaments(tournament_id) not null,
	final_result int
)

go

create table match_results (
	match_result_code int primary key,
	description nvarchar(250)
)

go

insert into match_results (match_result_code, description) values (0, 'Draw.'), (1, 'Player 1 win.'), (2, 'Player 2 win.')

go

create table matches (
	match_id int primary key identity(1, 1),
	tournament_id int foreign key references tournaments(tournament_id) not null,
	player1_id int foreign key references players(player_id) not null,
	player2_id int foreign key references players(player_id) not null,
	match_start_datetime datetime,
	result_code int,
	match_end_datetime datetime
)

go

create table sponsors (
	sponsor_id int primary key identity(1, 1),
	name nvarchar(75),
	phone char(11),
	details nvarchar(max)
)

go

create table tournament_sponsors (
	tournament_sponsor_id int primary key identity(1, 1),
	tournament_id int foreign key references tournaments(tournament_id) not null,
	sponsor_id int foreign key references sponsors(sponsor_id) not null
)