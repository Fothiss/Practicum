SELECT
    SUM(price_amount)
FROM acquisition
WHERE EXTRACT(YEAR FROM CAST(acquired_at AS date)) IN (2011, 2012, 2013)
    AND term_code = 'cash'