USE sakila;

select first_name,last_name from actor;

select * from actor;


SELECT  CONCAT(first_name,' ',last_name) as ActorName from actor;

select actor_id ,first_name,last_name from actor where first_name ='Joe';

select actor_id ,first_name,last_name from actor where first_name like '%Joe%';

select actor_id ,first_name,last_name from actor where last_name like '%Gen%';

select actor_id ,first_name,last_name from actor where last_name like '%LI%' order by last_name;

select * from country where country in ('Afghanistan','Bangladesh','China');

ALTER TABLE actor
ADD description blob;

select * from actor;


ALTER TABLE actor
DROP COLUMN  description;

select * from actor;

select distinct(last_name), count(last_name) from actor group by last_name ;

select distinct(last_name), count(last_name) 
from actor 
group by last_name 
having count(last_name)>2;

update actor 
set first_name='HARPO' where actor_id=172;	

select * from actor where actor_id=172;


update actor 
set first_name='GROUCHO' where actor_id=172;	


select * from address;

select * from staff;
-- Q6A--
select a.first_name,a.last_name, b.address,b.district,b.city_id,b.postal_code 
from staff a join address b
where a.address_id=b.address_id;

#Q6B# '2005-07-08 03:17:05'

select * from staff;

select * from payment;

select a.first_name,a.last_name, sum(b.amount) from staff a join payment b 
where a.staff_id=b.staff_id 
and b.payment_date >'2005-08-01' and b.payment_date<' 2005-08-31'
group by b.staff_id;

#Q6C#

select * from film_actor;

select * from film;

select a.title,a.film_id , count(b.actor_id) from film a join 

film_actor b  on a.film_id=b.film_id  group by b.film_id;

#Q6D#
select * from inventory;

select * from film;

select count(inventory_id) from inventory where film_id in(select film_id from film where title='Hunchback Impossible');

#Q6E

select * from payment;

select * from customer;

select a.first_name,a.last_name, sum(b.amount) AS TOTAL_AMOUNT_PAID from customer a 
join payment b on a.customer_id=b.customer_id group by b.customer_id 
order by a.last_name;


#Q7A#
select * from film where title like 'K%'or title like 'Q%';

select * from film where title='Alone Trip';#17

select * from actor;

select first_name,last_name from actor where actor_id in
 (select actor_id from film_actor where film_id in
 (select film_id from film where title='Alone Trip'));


#Q7C
select * from customer;

select * from city;

select * from address;

select * from country;


select a.first_name,a.last_name, a.email , b.district, d.country
from customer a  
 inner join address b on  a.address_id =b.address_id 
 inner join  city c on b.city_id=c.city_id 
 inner join country d  on c.country_id = d.country_id 
  where d.country='Canada';
 

#Q7D
select * from film_category;

select * from category;

select * from film;

select * from film where film_id in 
(select film_id  from film_category where category_id in 
(select category_id from category where name='Family'));


#--Q7E

select * from rental;

select *from inventory;

select * from film;

 select a.title ,count(c.inventory_id) AS Total_rental 
 from film a
inner join inventory b  on  a.film_id=b.film_id
inner join  rental c on b.inventory_id =c.inventory_id 
group by b.film_id order by  count(c.inventory_id) desc;



#Q7F#

select * from store;

select * from payment;

select sum(amount) , staff_id  as Store_id from payment group  by staff_id;

#Q7G#

select * from store;
select * from address;
select * from city;
select * from country;


select a.store_id, c.city,d.country from  store a 
join address b on a.address_id=b.address_id 
join city c on b.city_id= c.city_id
join country d on c.country_id=d.country_id;


#Q7H#

select * from category;

select * from film_category;

select * from inventory;

select * from rental;

select * from payment;

select a.name, sum(e.amount) as Total_earnings  from category a 
join film_category b on a.category_id=b.category_id
join inventory c on b.film_id=c.film_id
join rental d on c.inventory_id= d.inventory_id 
join payment e on d.rental_id =e.rental_id 
group by b.category_id order by Total_earnings desc
LIMIT 5;

#Q8A
create view gross_revenue AS
select a.name, sum(e.amount) as Total_earnings  from category a 
join film_category b on a.category_id=b.category_id
join inventory c on b.film_id=c.film_id
join rental d on c.inventory_id= d.inventory_id 
join payment e on d.rental_id =e.rental_id 
group by b.category_id order by Total_earnings desc
LIMIT 5;



#Q8B
select * from gross_revenue;

#Q8C
DROP VIEW gross_revenue;

Select * from gross_revenue;