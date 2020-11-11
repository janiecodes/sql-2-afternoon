--SYNTAX HINT
SELECT DISTINCT [column]
FROM [table];

-- 1.From the track table find a unique list of all composers.
SELECT DISTINCT composer
FROM track;

-- 2.From the invoice table find a unique list of all billing_postal_codes.
SELECT DISTINCT billing_postal_code
FROM invoice;

-- 3.From the customer table find a unique list of all companys.
SELECT DISTINCT company
FROM customer;
