

-- Create an address table.
create table address(
	id integer,
    city varchar(255),
    zip_code integer,
    street varchar(255),
    house_number integer,
    primary key (id)
);

-- Fill the table with data.
insert into address(id, city, zip_code, street, house_number) values(1, 'Budapest', 1007, 'Tölgyfa utca', 41);
insert into address(id, city, zip_code, street, house_number) values(2, 'Budapest', 1031, 'Almafa utca', 10);
insert into address(id, city, zip_code, street, house_number) values(3, 'Budapest', 1042, 'Körtefa utca', 58);
insert into address(id, city, zip_code, street, house_number) values(4, 'Debrecen', 4027, 'Almafa utca', 9);
insert into address(id, city, zip_code, street, house_number) values(5, 'Debrecen', 4078, 'Szilvafa utca', 41);
insert into address(id, city, zip_code, street, house_number) values(6, 'Csorna', 9300, 'Fűzfa utca', 77);
insert into address(id, city, zip_code, street, house_number) values(7, 'Csorna', 9300, 'Almafa utca', 1);
insert into address(id, city, zip_code, street, house_number) values(8, 'Győr', 9011, 'Szilvafa utca', 6);
insert into address(id, city, zip_code, street, house_number) values(9, 'Győr', 9013, 'Körtefa utca', 40);
insert into address(id, city, zip_code, street, house_number) values(10, 'Nyíregyháza', 4246, 'Tölgyfa utca', 88);

-- 1. task: Create a query that retrieves all records and columns in the address table.
select * from address;

-- 2. task: Create a query that retrieves all records in the address table, but only the city and street columns.
select city, street from address;


-- 3. task: Create a query that only queries addresses with more than 40 house numbers.
select * from address
where house_number > 40;

-- 4. task: Query only zip codes for addresses with less than 5000 zip code.
select zip_code from address
where zip_code < 5000;
