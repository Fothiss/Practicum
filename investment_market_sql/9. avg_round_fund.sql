SELECT 
    CASE
        WHEN invested_companies>=100 THEN 'high_activity'
        WHEN invested_companies>=20 THEN 'middle_activity'
        ELSE 'low_activity'
    END AS activity,
    ROUND(AVG(investment_rounds), 0) AS avg
FROM fund
GROUP BY activity
ORDER BY avg