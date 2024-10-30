SELECT id
FROM people
WHERE company_id IN    
    (SELECT id
    FROM company
    WHERE id IN 
        (SELECT company_id
        FROM funding_round
        WHERE is_first_round = 1 
            AND is_last_round = 1)
        AND status = 'closed')