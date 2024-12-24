SELECT DISTINCT(p.id),
       COUNT(e.instituition)
FROM people AS p
JOIN education AS e ON p.id = person_id
WHERE p.company_id IN    
    (SELECT id
    FROM company
    WHERE id IN 
        (SELECT company_id
        FROM funding_round
        WHERE is_first_round = 1 
            AND is_last_round = 1)
        AND status = 'closed')
    AND instituition IS NOT NULL
GROUP BY p.id