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
);

-- Create Table: Instrument
Create Table Instrument
(
	Name varchar(20) Primary Key,
	[Key] varchar(50)
);

-- Create Table: Album
Create Table Album
(
	Id int Primary Key Identity(1,1),
	Title varchar(20) not null,
	Date date,
	MusicianId int references Musician(Id)
);

-- Create Table: Song
Create Table Song
(
	Title varchar(20) Primary Key,
	Auther varchar(20)
);

-- Create Table: AlbumSong
Create Table AlbumSong
(
	AlbumId int references Album(Id),
	SongTitle varchar(20) Primary Key references Song(Title)
);

-- Create Table: MusicianSong
Create Table MusicianSong
(
	MusicianId int references Musician(Id),
	SongTitle varchar(20) references Song(Title),
	Primary Key(MusicianId, SongTitle)
);

-- Create Table: MusicianInstrument
Create Table MusicianInstrument
(
	MusicianId int references Musician(Id),
	InstrumentName varchar(20) references Instrument(Name),
	Primary Key(MusicianId, InstrumentName)
);