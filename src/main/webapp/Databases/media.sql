CREATE DATABASE MEDIA
GO
USE MEDIA
GO
-- TABLE VIDEO
CREATE TABLE VIDEO (
	videoid nvarchar(50) not null primary key,
	title nvarchar(100) not null,
	poster nvarchar(100) not null,
	views int not null,
	description nvarchar(150) not null,
	active bit not null
);
-- TABEL USER
CREATE TABLE USERS (
	userid nvarchar(50) not null primary key,
	username nvarchar(100) not null ,
	password nvarchar(100) not null,
	email nvarchar(100) not null,
	fullname nvarchar(200) not null,
	admin bit not null
);
-- TABLE FAVORITE
CREATE TABLE FAVORITE (
	favoriteid nvarchar(50) not null primary key,
	videoid nvarchar(50) foreign key references VIDEO(videoid),
	userid nvarchar(50) foreign key references USERS(userid), 
	likedate date not null
);
-- TABLE SHARE
CREATE TABLE SHARE (
	shareid nvarchar(50) not null primary key,
	videoid nvarchar(50) foreign key references VIDEO(videoid),
	userid nvarchar(50) foreign key references USERS(userid), 
	emails nvarchar(100) not null,
	sharedate date not null
)

