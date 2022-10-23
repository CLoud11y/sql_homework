select *, round(julianday(orderdate) - julianday(predate), 2)from(
	select O.id, O.orderdate,
	lag(orderdate, 1, orderdate) over(order by orderdate asc) predate
	from(
		select C.id 
		from customer as C
		where c.id = 'BLONP'
	) as C, 'order' as O
	where C.id = O.customerid
	limit 10
)
