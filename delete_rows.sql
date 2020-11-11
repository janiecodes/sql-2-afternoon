--SYNTAX HINT
DELETE FROM [table] WHERE [condition]

-- 1.Delete all 'bronze' entries from the table.
DELETE 
FROM practice_delete 
WHERE type = 'bronze';

-- 2.Delete all 'silver' entries from the table.
DELETE 
FROM practice_delete 
WHERE type = 'silver';

-- 3.Delete all entries whose value is equal to 150.
DELETE 
FROM practice_delete 
WHERE value = 150;