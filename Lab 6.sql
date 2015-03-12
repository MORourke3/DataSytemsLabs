-- 1 --
select distinct customers.name, customers.city
from customers
where city in (
	select city
	from (
		(select products.city, count(products.city)
		from products
		group by products.city 
		order by count DESC
		limit 1))
	as X)
-- 2 --
select products.name
from products
where priceUSD < (
	select avg(priceUSD)
	from products)
	
order by products.name ASC
-- 3 --
select customers.name, orders.pid, orders.dollars
from customers join orders
	on orders.cid = customers.cid 

order by dollars DESC
-- 4 --
select customers.name, coalesce(sum(orders.qty), 0)
from orders inner join products
	on orders.pid = products.pid
		full outer join customers
		on customers.cid = orders.cid
	group by customers.cid
	
order by customers.name DESC
-- 5 --
select customers.name, products.name, agents.name
from customers join orders
	on customers.cid = orders.cid
		join agents
		on orders.aid = agents.aid
			join products
			on products.pid = orders.pid
where orders.aid in (
	select aid
	from agents
	where city = 'Tokyo')
-- 6 --
select orders.ordno, orders.qty * products.priceUSD * (1 - customers.discount/100) as "check", orders.dollars as "dollars"
from orders, products, customers
where (orders.pid = products.pid)
	and (orders.cid = customers.cid) 
	and ((orders.qty * products.priceUSD * (1 - customers.discount/100)) != orders.dollars)

-- 7 --
A left outer join displays all of the rows from the "left" table and if they have anythign that matches on the right table.
A right outer join displays all of the rows of the "right" table and if they have anyhing that matches on the left table.
