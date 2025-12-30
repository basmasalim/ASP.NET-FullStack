-- Create Database
Create Database Musician 

USE Musician;

-- Create Table: Musician
Create Table Musician
(
	Id int Primary Key Identity(1,1),
	Name varchar(20) not null,  --Required
	PhNumber varchar(15),
	City varchar(20),
	Street varchar(20)
)

-- Create Table: Instrument
Create Table Instrument
(
	Name varchar(20) Primary Key,
	[Key] varchar(50)
)

-- Create Table: Album
Create Table Album
(
	Id int Primary Key Identity(1,1),
	Tittle varchar(20) not null,
	Date date,
	MusId int references Musician(Id)
)

-- Create Table: Song
Create Table Song
(
	Tittle varchar(20) Primary Key,
	Auther varchar(20)
)

-- Create Table: AlbumSong
Create Table AlbumSong
(
	AlbumId int references Album(Id),
	SongTittle varchar(20) Primary Key references Song(Tittle)
)

-- Create Table: MusSong
Create Table MusSong
(
	MusId int references Musician(Id),
	SongTittle varchar(20) references Song(Tittle),
	Primary Key(MusId, SongTittle)
)

-- Create Table: MusInstrument
Create Table MusInstrument
(
	MusId int references Musician(Id),
	InstName varchar(20) references Instrument(Name),
	Primary Key(MusId, InstName)
)