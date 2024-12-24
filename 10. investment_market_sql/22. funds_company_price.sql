WITH 
fund_count AS 
    (SELECT EXTRACT(MONTH FROM fr.funded_at) as month,
            COUNT(DISTINCT(inv.fund_id)) AS fund_count
    FROM funding_round AS fr
    JOIN investment AS inv ON fr.id = inv.funding_round_id
    WHERE EXTRACT(YEAR FROM fr.funded_at) BETWEEN 2010 AND 2013
          AND inv.fund_id IN (SELECT id
                            FROM fund
                            WHERE country_code = 'USA')
    GROUP BY EXTRACT(MONTH FROM fr.funded_at)),

company_count AS
    (SELECT EXTRACT(MONTH FROM acq.acquired_at) as month,
           COUNT(acq.acquired_company_id) AS company_count,
           SUM(acq.price_amount) AS total_amount
    FROM acquisition as acq
    WHERE EXTRACT(YEAR FROM acq.acquired_at) BETWEEN 2010 AND 2013
    GROUP BY month)

SELECT
    fc.month,
    fc.fund_count,
    cc.company_count,
    cc.total_amount
FROM fund_count AS fc
JOIN company_count AS cc ON fc.month = cc.month
