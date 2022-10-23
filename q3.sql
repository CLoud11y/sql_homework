select companyname, (
	select round((latenum * 1.0) / (num * 1.0) * 100, 2)
	from
		(select count(*) as latenum
		from 'order'
		where shipvia = shipper.id and ShippedDate > RequiredDate)
	    ,
		(select count(*) as num
		from 'order'
		where shipvia = shipper.id)
) as percentage
from shipper
order by percentage desc