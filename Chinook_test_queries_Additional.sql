-- 🎁 Bonus Fun Challenge
-- Create a view for “top customers” (those with total purchases > $50).
create or replace view top_customers as
select c.first_name||' '||c.last_name as Customer_name,sum(i.total) as total_purchase
from customer c
inner join invoice i
on c.customer_id=i.customer_id
group by 1
having sum(i.total)>50
order by 2

select * from top_customers

-- Create a stored procedure that returns a customer’s total spend given their ID.
CREATE OR REPLACE FUNCTION get_customer_total_spend(cust_id INT)
RETURNS NUMERIC AS $$
DECLARE
    total_spend NUMERIC;
BEGIN
    SELECT SUM(total)
    INTO total_spend
    FROM invoice
    WHERE customer_id = cust_id;

    RETURN COALESCE(total_spend, 0); -- If no invoices, return 0
END;
$$ LANGUAGE plpgsql;

select get_customer_total_spend(51)


-- Write a query that returns track name, album name, artist name, genre, and price — all in one row per track.
select t.name,a.title,ar.name,g.name,t.unit_price
from
genre g inner join track t
on g.genre_id=t.genre_id
inner join album a
on t.album_id=a.album_id
inner join artist ar
on a.artist_id=ar.artist_id
limit 3

--#2
SELECT 
    t.name AS track_name,
    al.title AS album_name,
    ar.name AS artist_name,
    g.name AS genre,
    t.unit_price AS price
FROM track t
JOIN album al ON t.album_id = al.album_id
JOIN artist ar ON al.artist_id = ar.artist_id
JOIN genre g ON t.genre_id = g.genre_id
limit 3



