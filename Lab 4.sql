Michael O'Rourke
Lab 4


1. Get the cities of agents booking an order for a customer whose cid is 'c006'.

select city 
from agents
where aid in 
	(select aid
	from orders
	where cid = 'c006');

2. Get the pids of products ordered through any agent who takes at least one order from a customer in Kyoto, sorted by pid from highest to lowest. (This is not the same as asking for pids of products ordered by customers in Kyoto.) 

select pid
from products
where pid in (
	select pid 
	from orders
	where cid in (
		select cid
		from customers
		where city = 'Kyoto'))

order by pid DESC

3. Get the cids and names of customers who did not place an order through agent a03. 

select cid, name
from customers
where cid not in (
	select cid
	from orders
	where aid = 'a03')

4. Get the cids of customers who ordered both product p01 and p07. 

select cid 
from orders
where pid = 'p01' intersect 
	select cid
	from orders
	where pid = 'p07'



5. Get the pids of products NOT ordered by any customers who placed any order through agent a05. 

select pid
from products
where pid in (
	select pid 
	from orders
	where pid not in (
		select pid
		from orders
                where aid = 'a05'))

6. Get the name, discounts, and city for all customers who place orders through agents in Dallas or New York. 

select name, discount, city
from customers
where cid in (
	select cid
	from orders
	where aid in (
		select aid
		from agents
		where (city = 'Dallas' or city = 'New York')))

7. Get all customers who have the same discount as that of any customers in Dallas or London 

select *
from customers
where discount in (
	select discount
	from customers
	where (city = 'Dallas' or city = 'London'))

8. Tell me about check constraints: What are they? What are they good for? What’s the advantage of putting that sort of thing inside the database? Make up some examples of good uses of check constraints and some examples of bad use 

	A check constraint is a constraint placed on a column that specifies its use. It makes the values in the column only able to be one data type. For example a good use of this is if the user is imputing money values, however forgot to include a dollar sign to indicate what type of currency, however the check constraint knows it needs USD. A bad use of a check constraint may be using it to limit a player id key to only take integers. This may cause an issue when looking at a table that would have many keys next to one another, Pid, Cid, Aid, for example. Just seeing integers would be confusing to see. 

