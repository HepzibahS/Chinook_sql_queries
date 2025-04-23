-- Intermediate Level
--Show each customer’s total number of invoices.
select customer_id,count(invoice_id) as total_no_invoices
from invoice
group by customer_id
order by 1


SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(i.invoice_id) AS total_invoices
FROM customer c
LEFT JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_invoices DESC;

--Find the most purchased track(s) (by count).
select t.track_id,t.name,count(*)
from invoice_line i
inner join track t
on t.track_id=i.track_id
group by t.track_id 
order by 3 desc


--Show the total revenue per country.
select country,sum(total)
from customer c inner join invoice i
on c.customer_id=i.customer_id
group by country
order by 2 desc


--Get a list of employees who support customers (support rep details).
select employee_id,e.first_name||' '||e.last_name as Employee_name
from employee e
left join customer c
on e.employee_id=c.support_rep_id
group by employee_id
order by 1

--Show all tracks that belong to the “Rock” genre.
select t.track_id, t.name from track t
inner join genre g
on t.genre_id=g.genre_id
where g.name='Rock'

--List the media types available and how many tracks fall under each.
select m.name,count(t.name) from media_type m
inner join track t
on m.media_type_id=t.media_type_id
group by m.name

--Find customers who have never made a purchase.
--1
select c.customer_id, c.first_name||' '||c.last_name
from customer c inner join invoice i
on c.customer_id=i.customer_id
where c.customer_id != i.customer_id

--2
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    c.email,
    c.country
FROM customer c
LEFT JOIN invoice i ON c.customer_id = i.customer_id
WHERE i.invoice_id IS NULL;


