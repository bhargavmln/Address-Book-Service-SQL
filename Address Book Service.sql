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
	 zip varchar(6) NOT NULL,
	 phone varchar(12) NOT NULL,
	 email varchar(250) NOT NULL
 );
 DESCRIBE address_book;
 
 #UC3
 INSERT INTO address_book(firstname,lastname,address,city,state,zip,phone,email) VALUES
 ('Naruto','Uzumaki','Konoha','Leaf  Village','Shippuden',936363,999999999,'naruto@gmail.com'),
 ('Sasuke','Uchiha','Konoha','Leaf  Village','Shippuden',936369,888888888,'uchiha@gmail.com'),
 ('Hinata','Hyuga','Konoha','Leaf  Village','Shippuden',565656,7777777777,'Hinata@gmail.com');
 SELECT * FROM address_book;
 
 