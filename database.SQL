CREATE DATABASE Library;
CREATE TABLE Shifts(
		Shift_ID BIGSERIAL PRIMARY KEY NOT NULL,
 	Shift_Name text NOT NULL,
 	Start_Time TIME NOT NULL,
 	Stop_Time TIME NOT NULL
	);

CREATE TABLE Librarians(
		Librn_ID BIGSERIAL PRIMARY KEY NOT NULL,
		Fullname Text NOT NULL,
		Email_Address VARCHAR(255) UNIQUE NOT NULL, 
		Telephone_No CHAR(10) UNIQUE NOT NULL,
		Shift_ID INT NOT NULL,
		FOREIGN KEY (Shift_ID) REFERENCES Shifts (Shift_ID) 
);
select * from librarians where Shift_ID = '1';

CREATE TABLE Publishing_Companies(
	Company_ID BIGSERIAL PRIMARY KEY NOT NULL,
	Company_Name TEXT UNIQUE NOT NULL,
	Co_Location VARCHAR NOT NULL
);

CREATE TABLE Authors(
	ID_No BIGSERIAL PRIMARY KEY NOT NULL,
	Author_Name TEXT NOT NULL,
	Email_Address VARCHAR(255) UNIQUE NOT NULL,
	Bio VARCHAR(255),
	Contact CHAR(10) UNIQUE NOT NULL,
	Company_ID INT NOT NULL,
	FOREIGN KEY (Company_ID) REFERENCES Publishing_Companies (Company_ID)
);
select Author_Name from authors;
select Author_name, Company_ID from authors;

CREATE TABLE Books(
	Bk_ID BIGSERIAL PRIMARY KEY NOT NULL,
	Bk_TITLE VARCHAR(255) UNIQUE NOT NULL,
	Author_ID INT NOT NULL,
	Description VARCHAR(255) NOT NULL,
	Price VARCHAR (255) NOT NULL,
	Publish_Date DATE NOT NULL,
	Publish_Year DATE NOT NULL,
	ISBN_No VARCHAR(255) NOT NULL,
	Image BYTEA NOT NULL,
	FOREIGN KEY (Author_ID) REFERENCES Authors (ID_No)
);

CREATE TABLE Students(
	Std_ID BIGSERIAL PRIMARY KEY NOT NULL,
	Full_Name TEXT NOT NULL,
	Contact VARCHAR(255) UNIQUE NOT NULL,
	Address VARCHAR(255) NOT NULL,
	Number_of_books INT NOT NULL,
	Date_of_borrowing DATE NOT NULL,
	Date_of_return DATE NOT NULL,
	Book_ID INT NOT NULL,
	Libralian_ID INT NOT NULL,
	FOREIGN KEY (Book_ID) REFERENCES Books (Bk_ID)
);

Inserting data into the tables
INSERT INTO Shifts (Shift_ID,
 	Shift_Name,
 	Start_Time,
 	Stop_Time ) 
VALUES ('1','Morning','8:00am','1:30pm'),('2','Afternoon','1:30pm','7:00pm');
select * from shifts;

INSERT INTO librarians (Librn_ID, Fullname, Email_Address, Telephone_No, Shift_ID)
VALUES ('1', 'Sarah Kiwumulo', 'sarah@gmail.com', '0709845367', '1'),
('2', 'Blessed Wonder', 'amblessed@gmail.com', '0778963344', '2'),
('3', 'Musasizi Paul', 'hismercyful@gmail.com', '0789983798','1'),
('4', 'By His Stripes', 'bhs@gmail.com', '0789785636', '1'),
('5', 'Martin Habbakuk', 'martin@gmail.com', '0756437288', '2'),
('6', 'Patience Glory', 'glory@gmail.com', '0709857654', '2');
select * from librarians;
select * from librarians where Shift_ID = 1

INSERT INTO publishing_companies(Company_ID, Company_Name, Co_Location)
VALUES('1', 'Readluck Publishers', 'Easternville-UK'),
('2', 'Heavenly dove readers', 'Eastern gate - New Jerusalem');
select * from publishing_companies;

INSERT INTO authors(ID_No, Author_Name, Email_Address, Bio, Contact, Company_ID)
VALUES ('1', 'Abraham Patrick', 'abraham@gmail.com', 'A writer of matters concerning technology, experience of 5years', '0786974834', '2'),
('2', 'Lydia Honest', 'honestme@gmail.com', 'Lady with passion for sharing knowledge', '0780895945', '1'),
('3', 'Tendo Grace', 'praise@gmnail.com', 'Lady with experience in whatever she publishes', '0785705027', '2'),
('4', 'Paul Cyrus', 'cyruspaul@gmail.com', 'Evident with whatever he writes', '0788758543', '1');
SELECT * FROM authors;

INSERT INTO books(Bk_TITLE, Author_ID, Description, Price, Publish_Date, Publish_Year, ISBN_No, Image)
VALUES ('1', 'Think Python', '1', 'Talks about the right syntax to use the python programming language', '$75.9', '23/04', '2000', '363276386373',''),
('2','JS for Professionals', '2', 'Designing sites and apps the professional way with JS', '$87.0', '03/11', '1999', '059786584753',''),
('3', 'Graphics at hand', '3', 'All categories of Graphics designers', '$57', '30/11', '2001', '456438726476', ''),
('4', 'Simplified Web design', '1', 'Have designing of website simplified at all levels', '$97', '21/02', '2000', '875427658736'),
('5', 'React devops', '3', 'All you need to know about react develop wbsites', '$90.2','13/04', '2001', '657849302346', ''),
('6', 'Understand Data-science', '4', 'Simplified datascience to the bone', '$100.5', '12/09', '2005', '462098567423');
select * from books;

