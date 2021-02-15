

-- Create an owners table.
create table owners(
	coupon_owner_id int,
    coupon_owner_name varchar(255) not null unique,
    primary key (coupon_owner_id)
);

-- Fill owners table with data.
insert into owners(coupon_owner_id, coupon_owner_name) values (1, 'Péter');
insert into owners(coupon_owner_id, coupon_owner_name) values (2, 'Béla');
insert into owners(coupon_owner_id, coupon_owner_name) values (3, 'Géza');
insert into owners(coupon_owner_id, coupon_owner_name) values (4, 'Ferenc');

-- Query owners table.
select * from owners;

-- Create a coupon table.
create table coupon(
coupon_id int,
discount int not null,
redeemed bool,
coupon_owner int,
primary key (coupon_id),
foreign key (coupon_owner) references owners(coupon_owner_id)
);


-- Fill coupon table with data.
insert into coupon(coupon_id, discount, redeemed, coupon_owner) values (1, 10, false, 1);
insert into coupon(coupon_id, discount, redeemed, coupon_owner) values (2, 5, false, 1);
insert into coupon(coupon_id, discount, redeemed, coupon_owner) values (3, 10, true, 2);
insert into coupon(coupon_id, discount, redeemed, coupon_owner) values (4, 15, true, 4);
insert into coupon(coupon_id, discount, redeemed, coupon_owner) values (5, 20, false, 4);
insert into coupon(coupon_id, discount, redeemed, coupon_owner) values (6, 5, false, 4);

-- Query coupon table.
select * from coupon;

-- 1. task: List the coupon ID, the names of the owners, and the amount of discounts in descending order based on the discount.
select
coupon_id as "Coupon ID",
coupon_owner_name as "Customer name",
discount as "Discount rate"
from coupon
join owners on owners.coupon_owner_id = coupon.coupon_owner
order by discount desc;

-- 2. task: Use the CONCAT (discount, "%") built-in function to change the projection so that a % sign appears after the discount rate.
select
coupon_id as "Coupon ID",
coupon_owner_name as "Customer name",
CONCAT(discount, "%") as "Discount rate"
from coupon
join owners on owners.coupon_owner_id = coupon.coupon_owner
order by discount desc;

-- 3. task: List how many coupons customers have in the system in total. Explain the choice of the JOIN version in a comment:
-- I use RIGHT JOIN because then it also lists from the owner table those who have no coupons at all.
select
coupon_owner_name as "Customer name", 
count(coupon_id) as "Amount of coupons"
from coupon
right join owners on owners.coupon_owner_id = coupon.coupon_owner
group by coupon_owner_name;

-- 4. task: Solve the task with LEFT JOIN.
select
coupon_owner_name as "Customer name", 
count(coupon_id) as "Amount of coupons"
from owners
left join coupon on owners.coupon_owner_id = coupon.coupon_owner
group by coupon_owner_name;

-- 5 task: List customers who have not yet redeemed coupons.
select distinct
coupon_owner_name as "The name of the customer who has unredeemed coupon"
from owners
join coupon on owners.coupon_owner_id = coupon.coupon_owner
where redeemed is false;


-- 6. task: Also list how many unredeemed coupons they have and what all the discounts are.
select
coupon_owner_name as "Customer name",
count(coupon_id) as "Number of coupons that can be used",
sum(discount) as "All available discounts"
from owners
join coupon on owners.coupon_owner_id = coupon.coupon_owner
where redeemed is false
group by coupon_owner_name;

