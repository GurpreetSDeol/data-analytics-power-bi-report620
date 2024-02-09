SELECT SUM(staff_numbers) AS total_staff_in_uk
FROM dim_store
WHERE country = 'UK';