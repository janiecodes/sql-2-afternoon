--SYNTAX HINT
SELECT [Column names] 
FROM [table] [abbv]
JOIN [table2] [abbv2] ON abbv.prop = abbv2.prop WHERE [Conditions];

SELECT a.name, b.name FROM some_table a JOIN another_table b ON a.some_id = b.some_id;
SELECT a.name, b.name FROM some_table a JOIN another_table b ON a.some_id = b.some_id WHERE b.email = 'e@mail.com';

--1.Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT * FROM invoice i
JOIN invoice_line il 
ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;

--2.Get the invoice_date, customer first_name and last_name, and total from all invoices.
SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c
ON c.customer_id = i.invoice_id;

--3.Get the customer first_name and last_name and the support rep's first_name and last_name from all customers.
--Support reps are on the employee table.
SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
JOIN employee e
ON c.support_rep_id = e.employee_id;

--4.Get the album title and the artist name from all albums.
SELECT al.title, ar.name
FROM album al
JOIN artist ar
ON al.artist_id = ar.artist_id;

--5.Get all playlist_track track_ids where the playlist name is Music.
SELECT pt.track_id
FROM playlist_track pt
JOIN playlist p
ON p.playlist_id = pt.playlist_id
WHERE p.name = 'Music';

--6.Get all track names for playlist_id 5.
SELECT t.name 
FROM track t
JOIN playlist_track pt
ON t.track_id = pt.track_id
WHERE pt.playlist_id = 5;

-- 7.Get all track names and the playlist name that they're on ( 2 joins ).
SELECT t.name, p.name
FROM track t
JOIN playlist_track pt
ON t.track_id = pt.track_id
JOIN playlist p
ON p.playlist_id = pt.playlist_id;

--8.Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).
SELECT t.name, a.title
FROM track t
JOIN album a
ON t.album_id = a.album_id
JOIN genre g
ON t.genre_id = g.genre_id
WHERE g.name = 'Alternative & Punk';


--Black Diamond
-- Get all tracks on the playlist(s) called Music and show their name, genre name, album name, and artist name.
-- At least 5 joins.
SELECT p.name, g.name, al.title, ar.name
FROM artist ar
JOIN album al
ON al.artist_id = ar.artist_id
JOIN track t
ON al.album_id = t.album_id
JOIN genre g
ON t.genre_id = g.genre_id
JOIN playlist_track pt
ON pt.track_id = t.track_id
JOIN playlist p
ON p.playlist_id = pt.playlist_id;
