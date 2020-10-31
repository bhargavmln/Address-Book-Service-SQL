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
 
 #UC11
  INSERT INTO address_book(firstname,lastname,address,city,state,zip,phone,email,bookname,contacttype) VALUES
 ('Rama','Rao','Everywhere','Leaf  Village','Goa',936363,333399999,'nkkm@gmail.com','Book A','family'),
 ('Krishna','Reddy','Nowhere','Sand  Village','Telangana','936369','444488888','njbm@gmail.com','Book B', 'friend');
 SELECT * FROM address_book;
 
 #UC12
 DROP TABLE address_book;
 
 
CREATE TABLE `Address_Details` (
  `add_id` varchar(6) NOT NULL,
  `address` varchar(250),
  `city` varchar(150),
  `state` varchar(150),
  `pin` varchar(6),
  PRIMARY KEY (`add_id`)
);

CREATE TABLE `Address_Book` (
  `book_id` varchar(6) NOT NULL,
  `Book_Name` varchar(150) NOT NULL,
  `Contact_Type` varchar(150) NOT NULL,
  PRIMARY KEY (`book_id`)
);

CREATE TABLE `Person_Details` (
  `id` int unsigned auto_increment NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(250) NOT NULL,
  `add_id` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  foreign key (add_id) references `Address_Details`(add_id)
);

CREATE TABLE `Book_Person` (
  `book_id` varchar(6) NOT NULL,
  `id` int unsigned NOT NULL,
    foreign key (book_id) references `Address_book`(book_id),
	foreign key (id) references `person_details`(id)
);

INSERT INTO address_details(add_id, address, city, state, pin) VALUES 
('ADD101', 'Flat', 'Hyderabad', 'Telangana', '500011'),
('ADD102', 'Plot', 'Vizag', 'AP', '542111'),
('ADD103', 'Hut', 'Pune', 'Maharashtra', '875111'),
('ADD104', 'office', 'Mumbai', 'Maharashtra', '875262');

INSERT INTO address_book(book_id,book_name,contact_type) VALUES
('AB001', 'book_A', 'family'),
('AB002', 'book_B', 'friend'),
('AB003', 'book_A', 'office');

INSERT INTO person_details(first_name,last_name,phone,email,add_id) VALUES
('Miral','Modi','1231231231','abc@gmail.com','ADD104'),
('Mula','Venkat','9879879879','def@gmail.com','ADD102'),
('Bhargav','Mankala','9639639639','cba@gmail.com','ADD101'),
('Koushik','Mankala','3693693693','fed@gmail.com','ADD101'),
('Nishant','Chauhan','4564564564','xyz@gmail.com','ADD103');

INSERT INTO book_person(book_id,id) VALUES
('AB001',3),
('AB001',4),
('AB002',5),
('AB003',5),
('AB003',1),
('AB002',2);

SELECT * 
FROM person_details left Join address_details
ON person_details.add_id = address_details.add_id
HAVING state = 'AP';

SELECT state,COUNT(*)
FROM person_details left Join address_details
ON person_details.add_id = address_details.add_id
GROUP BY state;

SELECT city,COUNT(*)
FROM person_details left Join address_details
ON person_details.add_id = address_details.add_id
GROUP BY city;

SELECT city,first_name
FROM person_details left Join address_details
ON person_details.add_id = address_details.add_id
HAVING city = 'Hyderabad'
ORDER BY first_name;

SELECT contact_type, count(*)
FROM address_book JOIN book_person
ON address_book.book_id = book_person.book_id
GROUP BY contact_type;
