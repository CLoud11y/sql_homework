select id, shipcountry, 
case when shipcountry = 'USA' or shipcountry = 'Mexico' or shipcountry = 'Canada'
	then 'NorthAmerica'
	else 'OtherPlace'
end
from(
	select id, shipcountry
	from 'order'
	order by id asc
)
where id >= 15445
limit 20;
