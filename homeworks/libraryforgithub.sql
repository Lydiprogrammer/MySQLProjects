

--  Create a publisher table.
create table publisher(
publisher_id int,
publisher_name varchar(255) unique not null,
self_publisher bool default false,
primary key (publisher_id)
);

-- Fill publisher table with data.
insert into publisher(publisher_id, publisher_name, self_publisher) values (1, 'PANEM KFT.', false);
insert into publisher(publisher_id, publisher_name, self_publisher) values (2, 'Hatvany Béla Csaba', true);
insert into publisher(publisher_id, publisher_name, self_publisher) values (3, 'Szukits Könyvkiadó és Könyvkereskedés', false);
-- 1. task: Specify an insert statement that violates the publisher_name not null constraint in the publisher table.
insert into publisher(publisher_id, publisher_name, self_publisher) values (10, null, false);
-- 2. task: Specify an insert statement that violates the unique constraint on publisher_name in the publisher table.
insert into publisher(publisher_id, publisher_name, self_publisher) values (11, 'PANEM KFT.', false);

-- Query publisher table.
select * from publisher;

-- Create an author table.
create table author(
author_id int,
author_name varchar (255) not null,
primary key (author_id)
);

-- Fill author table with data.
insert into author(author_id, author_name) values (4, 'Jeffrey D. Ullmann');
insert into author(author_id, author_name) values (5, 'Hatvany Béla Csaba');
insert into author(author_id, author_name) values (6, 'Christie Golden');
-- 3. task: Specify an insert statement that violates the primary key constraint in the author table.
insert into author(author_id, author_name) values (4, 'Christie Golden');

-- Query author table.
select * from author;

-- Create a book table.
create table book(
book_id int,
book_name varchar (255) not null,
publisher int,
author int,
primary key (book_id),
foreign key (publisher) references publisher(publisher_id),
foreign key (author) references author(author_id)
);

-- Fill book table with data.
insert into book(book_id, book_name, publisher, author) values (7,'Adatbázisrendszerek - Alapvetés', 1, 4);
insert into book(book_id, book_name, publisher, author) values (8,'MySQL.NET - MySQL Server adatbázis-programozás.NET környezetben', 2, 5);
insert into book(book_id, book_name, publisher, author) values (9,'Bitképek feldolgozása Visual Basic programból', 2, 5);
-- 4. task: Specify an insert statement that violates the foreign key constraint on the publisher in the book table.
insert into book(book_id, book_name, publisher, author) values (10,'SQL', 4, 4);
-- 5. task: Specify an insert statement that violates the foreign key constraint on the author in the book table.
insert into book(book_id, book_name, publisher, author) values (11,'MySQL.NET', 2, 7);
-- Query book table.
select * from book;

-- 6. task: Create a query that lists the names of all the books, their authors, and their publishers.
select a.author_name as "Author's name", b.book_name as "Book name", p.publisher_name as "Publisher name"
from book as b
join author as a on b.author = a.author_id
join publisher as p on b.publisher = p.publisher_id
;


