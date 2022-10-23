select * from(
select categoryname, count(*) as num, round(avg(unitprice),2), min(unitprice), max(unitprice), sum(unitsonorder)
from category, product
where category.id = product.categoryid
group by category.id
order by category.id
)
where num > 10