select group_concat(productname, ', ') from(
select productname 
from customer as C, 'order' as O, orderdetail, product as P
where companyname = 'Queen Cozinha' and C.id = O.customerid
and O.id = orderid and productid = P.id
and orderdate like '2014-12-25%'
order by P.id asc
)