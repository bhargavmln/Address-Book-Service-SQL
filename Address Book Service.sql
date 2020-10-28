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
 ('Hinata','Hyuga','Konoha','Leaf  Village','Shippuden',565656,7777777777,'Hinata@gmail.com'),
 ('Abhishek','Kumar','Mumbai','Sand Village','Shippuden',123123,0000000000,'abi@gmail.com'),
 ('Koushik','Mankala','Pune','Leaf  Village','Shippuden',936369,5555555555,'kou@gmail.com'),
 ('Bhargav','MLN','Pune','Sand  Village','Shippuden',565656,7777777777,'baa@gmail.com');
 SELECT * FROM address_book;
 
 #UC4
 UPDATE address_book
 SET phone = '1234567890'
 WHERE firstname = 'Hinata';
 SELECT * FROM address_book;
 
#UC5
DELETE FROM address_book
WHERE firstname = 'Hinata';
SELECT * FROM address_book;

#UC6
SELECT * FROM address_book 
WHERE city = 'Leaf  Village';

#UC7
SELECT city,count(firstname) FROM address_book GROUP BY city;
SELECT state,count(firstname) FROM address_book GROUP BY state;

#UC8
SELECT *  
FROM address_book 
WHERE city = 'Leaf  Village'
ORDER BY firstname; 

#UC9
ALTER TABLE address_book ADD bookname varchar(250);
ALTER TABLE address_book ADD contacttype varchar(250);
DESCRIBE address_book;

UPDATE address_book SET bookname = 'Book A', contacttype = 'family' WHERE firstname = 'Koushik';
UPDATE address_book SET bookname = 'Book A', contacttype = 'family' WHERE firstname = 'Bhargav';
UPDATE address_book SET bookname = 'Book B', contacttype = 'friend' WHERE firstname = 'Abhishek';
UPDATE address_book SET bookname = 'Book C', contacttype = 'cartoon' WHERE firstname = 'Naruto';
UPDATE address_book SET bookname = 'Book C', contacttype = 'cartoon' WHERE firstname = 'Sasuke';

#UC10
SELECT contacttype,count(firstname) 
FROM address_book 
GROUP BY contacttype;
 