SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'orders';