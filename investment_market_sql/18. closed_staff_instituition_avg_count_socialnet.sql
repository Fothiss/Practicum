WITH people_instituition AS (
    SELECT p.id,
           COUNT(e.instituition) AS count_istituition
    FROM people AS p
    JOIN education AS e ON p.id = e.person_id
    WHERE p.company_id IN (SELECT id
                           FROM company
                           WHERE name = 'Socialnet')
    GROUP BY p.id)

SELECT AVG(count_istituition)
FROM people_instituition