Michael O'Rourke
Lab 5
-- 1 --
select city
from agents inner join 
	orders on
	agents.aid = orders.aid
where cid = 'c006'
-- 2 --
select pid
from orders inner join 
	customers on 
	orders.cid = customers.cid
where customers.city = 'Kyoto'

order by pid ASC
-- 3 --
select name
from customers
where cid not in (
	select cid
	from orders)
-- 4 --
select name 
from customers left join
	orders on
	orders.cid = customers.cid
where orders.cid is null
-- 5 --
select distinct customers.name, agents.name
from customers join agents
	on customers.city = agents.city
		join orders
	on customers.cid = orders.cid and agents.aid = orders.aid
-- 6 --
select distinct customers.name, agents.name, customers.city
from customers join agents 
	on customers.city = agents.city
-- 7 --
select distinct customers.name, customers.city
from customers 
where city in (
	select city 
	from (
		(select products.city, count(products.city)
		from products
		group by products.city
		limit 1))
	as X )
