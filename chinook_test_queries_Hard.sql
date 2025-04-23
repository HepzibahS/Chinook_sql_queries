-- 🚀 Advanced Level
-- Which genre generated the most revenue?
select g.name, sum(quantity*il.unit_price)
from genre g inner join track t
on g.genre_id=t.genre_id
inner join invoice_line il
on t.track_id=il.track_id
group by 1
order by 2 desc
limit 1


-- Show the monthly revenue trend (total invoice per month).
select extract( month from invoice_date) as month,
sum(total) from invoice
group by extract( month from invoice_date)
order by month


-- Which artist has the most tracks in the database?
select a.name, count(track_id)
from artist a inner join album al
on a.artist_id=al.artist_id
inner join track t
on al.album_id=t.album_id
group by 1
order by 2 desc
limit 1

-- Get a list of customers with their most recent invoice total.
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    i.total AS latest_invoice_total,
    i.invoice_date AS latest_invoice_date
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
WHERE i.invoice_date = (
    SELECT MAX(i2.invoice_date)
    FROM invoice i2
    WHERE i2.customer_id = c.customer_id
)

-- Show the customer who spent the most money overall.
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 1;


-- What are the top 5 selling artists based on invoice item sales?
select a.name,sum(i.unit_price*i.quantity) as total_sales
from artist a inner join album b
on a.artist_id=b.artist_id
inner join track t
on b.album_id=t.album_id
inner join invoice_line i
on i.track_id=t.track_id
group by a.name
order by 2 desc
limit 5

-- Rank employees by the total revenue generated from the customers they support.
select e.first_name||' '||e.last_name as Employee_name, sum(i.total) as total_revenue
from employee e
inner join customer c
on e.employee_id=c.support_rep_id
inner join invoice i
on i.customer_id=c.customer_id
group by 1
order by 2 desc


-- Find tracks that are part of more than one album (tricky one 😄).
SELECT 
    t.name AS track_name,
    COUNT(DISTINCT t.album_id) AS album_count
FROM track t
GROUP BY t.name
HAVING COUNT(DISTINCT t.album_id) > 1
ORDER BY album_count DESC

