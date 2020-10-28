#UC1
CREATE DATABASE address_book_service;
SHOW databases;
USE address_book_service;
SELECT database();

#UC2
CREATE TABLE address_book(
	 firstname varchar(50) NOT NULL,
	 lastname varchar(50) NOT NULL,
	 address varchar(250) NOT NULL,
	 city varchar(100) NOT NULL,
	 state varchar(100) NOT NULL,
	 zip int unsigned NOT NULL,
	 phone int NOT NULL,
	 email varchar(250) NOT NULL
 );
 DESCRIBE address_book;
 