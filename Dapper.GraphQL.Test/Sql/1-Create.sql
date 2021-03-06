﻿CREATE TABLE Person (
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY(1, 1),
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	-- Known issue with FK reference to non-null numeric types
	-- https://github.com/StackExchange/Dapper/issues/917
	SupervisorId INTEGER,
	CareerCounselorId INTEGER,
	FOREIGN KEY (SupervisorId) REFERENCES Person(Id),
	FOREIGN KEY (CareerCounselorId) REFERENCES Person(Id)
);

CREATE TABLE Email (
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[Address] NVARCHAR(250),
	PersonId INTEGER,
	FOREIGN KEY(PersonId) REFERENCES Person(Id)
);

CREATE TABLE Phone (
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Number NVARCHAR(16),
	[Type] INTEGER,
	PersonId INTEGER,
	FOREIGN KEY(PersonId) REFERENCES Person(Id)
);
