SELECT
    country_code,
    MIN(invested_companies),
    MAX(invested_companies),
    AVG(invested_companies)
FROM fund
WHERE EXTRACT(YEAR FROM founded_at) IN (2010, 2011, 2012)
GROUP BY country_code
HAVING MIN(invested_companies) <> 0
ORDER BY avg DESC, country_code
LIMIT 10