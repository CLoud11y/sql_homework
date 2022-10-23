select companyname, customerid, exp from(
select companyname, customerid, exp,
ntile(4) over (
    order by exp asc
) as ntile from(
	select companyname, all_c.customerid , round(sum(unitprice * quantity), 2) as exp 
	from(
		select ifnull(companyname, 'MISSING_NAME') as companyname, customerid from(
			select distinct customerid
			from 'order'
		) as O left outer join customer as C on C.id = O.customerid
	) as all_c, 'order' as O, orderdetail as OD 
	where all_c.customerid = O.customerid and O.id = OD.orderid
	group by all_c.customerid
)
)
where ntile = 1