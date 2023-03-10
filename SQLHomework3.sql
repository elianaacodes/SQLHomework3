-- Question 1
select first_name, last_name 
from customer 
inner join address
on address.address_id = customer.address_id and address.district = 'Texas';

-- Jennifer Davis, Kim Cruz, Richard McCrary, Bryan Hardison, Ian Still 

-- Question 2 
select first_name, last_name 
from customer 
inner join payment 
on customer.customer_id = payment.customer_id
where amount > 6.99; 

-- Peter Menard 

-- Question 3
select * 
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having SUM(amount) > 175
	order by SUM(amount)desc
); 

-- Peter Menard 

-- Question 4 
select country_id
from country 
where country = 'Nepal';

select city_id
from city 
where country_id = 66;

select first_name, last_name
from customer 
where address_id in (
	select address_id
	from address 
	where city_id in (
		select city_id
		from city 
		where country_id = 66
	)
);

-- Kevin Schuler 


-- Question 5 
select count(AMOUNT),staff_id 
from payment 
group by staff_id
order by SUM(amount) desc; 

select first_name, last_name, staff_id 
from staff 
where staff_id=2; 

-- Jon Stephens 

-- Question 6 
select COUNT(rating), rating 
from film 
group by rating
order by count(rating) desc; 

-- 223 PG-13 movies, 209 NC-17 movies, 196 R movies, 194 PG movies, 178 G movies.

-- Question 7

select first_name, last_name, customer_id 
from customer 
where customer_id in (
	select customer_id 
	from payment 
	where amount > 6.99
	group by customer_id 
	having count(payment_id) = 1
);

-- None 

-- Question 8 
select rental_id 
from rental
where rental_id in (
	select rental.rental_id 
	from rental 
	left join payment 
	on payment.rental_id = rental.rental_id 
	where payment.rental_id is null); 

-- 1452 





