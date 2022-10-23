select productname, companyname, contactname from(
select P.productname, min(O.orderdate), customerid
from product as P, orderdetail as OD, 'order' as O
where P.discontinued = 1 and P.id = OD.productid and OD.orderid = O.id
group by P.productname
order by P.productname 
), customer as C
where customerid = C.id
-- C.companyname, C.contactname