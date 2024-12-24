SELECT
    c.name,
    COUNT(DISTINCT(e.instituition))
FROM company AS c
JOIN people AS p ON c.id = p.company_id
JOIN education AS e ON p.id = e.person_id
GROUP BY c.name
ORDER BY count DESC
LIMIT 5