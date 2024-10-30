SELECT
    f.name AS name_of_fund,
    c.name AS name_of_company,
    fr.raised_amount AS amount
FROM investment AS i
JOIN fund AS f ON i.fund_id = f.id
JOIN company AS c ON i.company_id = c.id
JOIN funding_round AS fr ON i.funding_round_id = fr.id
WHERE EXTRACT(YEAR FROM fr.created_at) IN (2012, 2013)
      AND c.milestones > 6