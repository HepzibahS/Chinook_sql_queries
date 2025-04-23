--EASY
-- List all customers with their full name, email, and country.
select first_name||' '||last_name as full_name,email,country
from customer

-- Get the total number of tracks in the database.
select distinct(count(track_id)) from track

-- List all unique genres available in the database.
select distinct name 
from genre

-- Show all albums by a specific artist (e.g., “AC/DC”).

select * from album a
inner join artist ar
on ar.artist_id=a.artist_id
where ar.name='AC/DC'

-- Find the top 5 countries with the most customers.
select country, count(customer_id) from customer
group by 1
order by 2 desc
limit 5

-- Show the invoice dates and totals for a particular customer (e.g., customer with ID 5).
select invoice_date,total
from invoice
where customer_id=51

-- List all tracks that cost more than $0.99.
select track_id,name from track
where unit_price>0.99

