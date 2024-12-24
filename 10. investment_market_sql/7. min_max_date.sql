SELECT
    CAST(funded_at AS date) AS fund_date,
    MIN(raised_amount),
    MAX(raised_amount)
FROM funding_round
GROUP BY fund_date
HAVING MIN(raised_amount) > 0 AND MIN(raised_amount) <> MAX(raised_amount)